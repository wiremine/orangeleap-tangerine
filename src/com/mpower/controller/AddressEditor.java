package com.mpower.controller;

import java.beans.PropertyEditorSupport;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mpower.domain.Address;
import com.mpower.service.AddressService;

public class AddressEditor extends PropertyEditorSupport {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    private AddressService addressService;

    public AddressEditor() {
        super();
    }

    public AddressEditor(AddressService addressService) {
        super();
        setAddressService(addressService);
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public void setAsText(String text) throws IllegalArgumentException {
        if (NumberUtils.isDigits(text)) {
            Long paymentSourceId = NumberUtils.createLong(text);
            Address a = addressService.readAddress(paymentSourceId);
            setValue(a);
        } else {
            setValue(new Address());
        }
    }
}
