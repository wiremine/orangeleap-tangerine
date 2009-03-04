package com.mpower.service;

import java.util.Calendar;
import java.util.List;

import com.mpower.domain.model.communication.Address;

public interface AddressService {

    public Address saveAddress(Address address);

    public List<Address> readAddressesByConstituentId(Long personId);

    public List<Address> filterValidAddresses(Long personId);

//    public void setAuditService(AuditService auditService);

    public Address readAddress(Long addressId);

    public List<Address> readCurrentAddresses(Long personId, Calendar calendar, boolean receiveCorrespondence);
}
