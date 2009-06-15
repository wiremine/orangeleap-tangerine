package com.orangeleap.tangerine.test.controller.validator;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.springframework.validation.BindException;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import com.orangeleap.tangerine.controller.validator.PaymentSourceValidator;
import com.orangeleap.tangerine.domain.PaymentSource;
import com.orangeleap.tangerine.domain.Constituent;
import com.orangeleap.tangerine.service.PaymentSourceService;
import com.orangeleap.tangerine.test.BaseTest;

public class PaymentSourceValidatorTest extends BaseTest {

    private PaymentSourceValidator validator;
    private PaymentSource source;
    private BindException errors;
    private Mockery mockery;
    private final Long CONSTITUENT_ID = 1L;

    @BeforeMethod
    public void setupMocks() {
        mockery = new Mockery();
        validator = new PaymentSourceValidator();

        source = new PaymentSource();
        Constituent constituent = new Constituent();
        constituent.setId(CONSTITUENT_ID);
        source.setConstituent(constituent);

        errors = new BindException(source, "paymentSource");

        final PaymentSourceService service = mockery.mock(PaymentSourceService.class);
        validator.setPaymentSourceService(service);

        mockery.checking(new Expectations() {{
            allowing (service).findPaymentSourceProfile(CONSTITUENT_ID, "MyProfile"); will(returnValue(new PaymentSource()));
        }});
    }

    @Test(groups = { "validatePaymentProfile" })
    public void testValidPaymentProfile() throws Exception {
        source.setProfile(null);
        validator.validatePaymentProfile(source, errors);

        mockery.assertIsSatisfied();
        assert errors.hasFieldErrors() == false;
    }

    @Test(groups = { "validatePaymentProfile" })
    public void testBlankPaymentProfile() throws Exception {
        source.setProfile("  ");
        validator.validatePaymentProfile(source, errors);

        mockery.assertIsSatisfied();
        assert "blankPaymentProfile".equals(errors.getFieldError("profile").getCode());
    }

    @Test(groups = { "validatePaymentProfile" })
    public void testExistingPaymentProfileForNewPaymentSource() throws Exception {
        source.resetIdToNull();
        source.setProfile("MyProfile");
        validator.validatePaymentProfile(source, errors);

        mockery.assertIsSatisfied();
        assert "paymentProfileAlreadyExists".equals(errors.getFieldError("profile").getCode());
    }

    @Test(groups = { "validatePaymentProfile" })
    public void testExistingPaymentProfileForExistingPaymentSource() throws Exception {
        source.setId(new Long(1));
        source.setProfile("MyProfile");
        validator.validatePaymentProfile(source, errors);

        mockery.assertIsSatisfied();
        assert errors.hasFieldErrors() == false;
    }
}
