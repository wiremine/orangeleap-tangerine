package com.orangeleap.tangerine.security;

import org.springframework.security.ui.SpringSecurityFilter;
import org.springframework.security.ui.FilterChainOrder;
import org.springframework.security.Authentication;
import org.springframework.security.GrantedAuthority;
import org.springframework.security.userdetails.ldap.LdapUserDetails;
import org.springframework.security.providers.cas.CasAuthenticationToken;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.ldap.core.ContextSource;
import org.springframework.ldap.core.simple.SimpleLdapTemplate;
import org.springframework.ldap.NamingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.*;

import com.orangeleap.tangerine.util.HttpUtil;
import com.orangeleap.tangerine.service.ldap.LdapService;
import com.orangeleap.tangerine.service.customization.PageCustomizationService;
import com.orangeleap.tangerine.service.ConstituentService;
import com.orangeleap.tangerine.service.SessionService;
import com.orangeleap.tangerine.type.AccessType;
import com.orangeleap.tangerine.domain.Constituent;

/**
 * This security filter will decorate the web HttpSession with information needed
 * by the Tangerine Views/Pages. It makes use of several services to pull together
 * the necessary information, including an LDAP call. The need to populate this
 * extra data is determined by the absence of the <code>pageAccess</code>
 * parameter in the HttpSession.
 */
public class TangerineSessionInformationFilter extends SpringSecurityFilter {

    @Autowired
    private LdapService ldapService;

    @Autowired
    private ContextSource contextSource;

    @Autowired
    private PageCustomizationService pageCustomizationService;

    @Autowired
    private ConstituentService constituentService;

    @Autowired
    private SessionService sessionService;

    @Override
    protected void doFilterHttp(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth != null && (auth instanceof CasAuthenticationToken) && auth.isAuthenticated()) {

            // Set some session values based on LDAP login information, but only do this once
            // to save unnecessary LDAP calls
            if (WebUtils.getSessionAttribute(request, "pageAccess") == null) {

                CasAuthenticationToken token = (CasAuthenticationToken) auth;
                loadTangerineDetails(token);

                TangerineAuthenticationDetails details = (TangerineAuthenticationDetails) token.getDetails();

                HttpUtil.setCookie("siteCookie", details.getSite(), Integer.MAX_VALUE, response);
                WebUtils.setSessionAttribute(request, "pageAccess", details.getPageAccess());
                WebUtils.setSessionAttribute(request, "passwordChangeRequired", ldapService.isPasswordChangeRequired(60));
                WebUtils.setSessionAttribute(request, "lastLoginDate", ldapService.getLastLogin());
                WebUtils.setSessionAttribute(request, "currentDate", new Date());
                ldapService.setLastLogin();
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public int getOrder() {
        return FilterChainOrder.EXCEPTION_TRANSLATION_FILTER + 10;
    }

    /**
     * Initialize the TangerineAuthenticationDetails object inside the CasAuthenticationToken.
     * This method will make use of the ConstituentService and PageCustomizationService
     * to load the needed information about the constituent.
     * @param token the CasAuthenticationToken with the constituent information
     */
    private void loadTangerineDetails(CasAuthenticationToken token) {

        GrantedAuthority[] authorities = token.getAuthorities();
        LdapUserDetails user = (LdapUserDetails) token.getPrincipal();

        String username = user.getUsername();
        String sitename = "";
        if(user.getUsername().indexOf("@") > -1) {
            String[] split = username.split("@");
            username = split[0];
            sitename = split[1];
        }

        TangerineAuthenticationDetails details = (TangerineAuthenticationDetails) token.getDetails();
        details.setUserName(username);
        details.setSite(sitename);
        getLdapDetails(details, user.getDn());

        List<String> roles = new ArrayList<String>();

        for(GrantedAuthority auth:authorities) {
            roles.add(auth.getAuthority());
        }

        Map<String, AccessType> pageAccess = pageCustomizationService.readPageAccess(roles);
        details.setPageAccess(pageAccess);

         /* HACK: this method ensures the authenticated user exists in the Tangerine
         * database. It will attempt to lookup the user/site, and if not found, it will
         * create it. Placing this here avoids having to override a base Spring Security
         * just to do this.
         */
        sessionService.lookupSite();

        Constituent constituent = constituentService.readConstituentByLoginId(username);
        details.setConstituentId(constituent.getId());
        details.setLastName(constituent.getLastName());
        details.setFirstName(constituent.getFirstName());
    }


    /**
     * Query LDAP to initialize the firstName and lastName fields of the details object
     * based on the sn and cn values. Needed when creating new users on first login.
     * @param details the TangerineAuthenticationDetails object to populate fields
     * @param dn the fully qualified DN for the user
     * @throws NamingException if bad things happen
     */
    protected void getLdapDetails(TangerineAuthenticationDetails details, String dn) throws NamingException {

        SimpleLdapTemplate template = new SimpleLdapTemplate(contextSource);

        // dn contains the FQDN, so strip off the dc
        int posn = dn.indexOf(",dc=");
        if(posn != -1) {
            dn = dn.substring(0,posn);
        }

        DirContextOperations user = template.lookupContext(dn);

        if (user != null) {

            Object attribute = user.getObjectAttribute("cn");
            if (attribute != null) {
                String cn = ("" + attribute).trim();
                int i = cn.indexOf(" ");
                if (i == -1) {
                    details.setLastName(cn);
                } else {
                    details.setFirstName(cn.substring(0, i));
                    details.setLastName(cn.substring(i + 1));
                }
            }
            attribute = user.getObjectAttribute("sn");
            if (attribute != null) {
                String sn = ("" + attribute).trim();
                details.setLastName(sn);
            }
        }
    }
}
