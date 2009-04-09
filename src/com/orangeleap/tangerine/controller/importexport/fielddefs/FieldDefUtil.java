package com.orangeleap.tangerine.controller.importexport.fielddefs;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.orangeleap.tangerine.controller.importexport.exporters.FieldDescriptor;
import com.orangeleap.tangerine.domain.customization.FieldDefinition;
import com.orangeleap.tangerine.service.SiteService;
import com.orangeleap.tangerine.type.FieldType;
import com.orangeleap.tangerine.type.PageType;
import com.orangeleap.tangerine.util.TangerineUserHelper;

public class FieldDefUtil {
	
	private static final Log logger = LogFactory.getLog(FieldDefUtil.class);

	public static interface Exclusion {
		public boolean excludeField(String name, FieldDefinition fd);
	}
	
	public static List<FieldDescriptor> getFieldDescriptors(Exclusion exclusion, PageType pageType, SiteService siteservice, TangerineUserHelper tangerineUserHelper) {
		
		Map<String, FieldDefinition> fields = siteservice.readFieldTypes(pageType, tangerineUserHelper.lookupUserRoles());
		
		// Use siteservice to read FIELD_DEFINITIONS to get all entity fields for site.
		List<FieldDescriptor> list = new ArrayList<FieldDescriptor>();
		for (Map.Entry<String, FieldDefinition> es : fields.entrySet()) {
			String name = es.getKey();
			FieldDefinition fd = es.getValue();
			if (exclusion.excludeField(name, fd)) {
                continue;
            }
			logger.debug("HEADER_FIELD : "+ name);
			if (fd.isCustom()) {
				list.add(new FieldDescriptor(fd.getCustomFieldName(), FieldDescriptor.CUSTOM, fd));
			} else if (name.contains("addressMap[")) {
				list.add(new FieldDescriptor(name, FieldDescriptor.ADDRESS, fd));
			} else if (name.contains("phoneMap[")) {
				list.add(new FieldDescriptor(name, FieldDescriptor.PHONE, fd));
			} else if (name.contains("emailMap[")) {
				list.add(new FieldDescriptor(name, FieldDescriptor.EMAIL, fd));
			} else {
				list.add(new FieldDescriptor(name, FieldDescriptor.NATIVE, fd));
			}
		}
		
		Collections.sort(list, new Comparator<FieldDescriptor>() {
			@Override
			public int compare(FieldDescriptor o1, FieldDescriptor o2) {
				if (o1.getType() == o2.getType()) {
					return o1.getName().compareTo(o2.getName());
				} else {
				    return o1.getType() - o2.getType();
				}
			}
		});

		return list;
		
	}
	

	public static Exclusion getDefaultExclusions() {
		return new Exclusion() {
			public boolean excludeField(String name, FieldDefinition fd) {
				return  
				fd.getFieldType() == FieldType.ADDRESS_PICKLIST
				|| fd.getFieldType() == FieldType.EMAIL_PICKLIST
				|| fd.getFieldType() == FieldType.PHONE_PICKLIST
				|| fd.getFieldType() == FieldType.PAYMENT_SOURCE_PICKLIST
				|| fd.getFieldType() == FieldType.PREFERRED_PHONE_TYPES
				;
			}

		};
	}

}
