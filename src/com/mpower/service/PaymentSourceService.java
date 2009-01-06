package com.mpower.service;

import java.util.List;

import com.mpower.domain.PaymentSource;

public interface PaymentSourceService {

    public PaymentSource maintainPaymentSource(PaymentSource paymentSource);

    public List<PaymentSource> readPaymentSources(Long personId);

    public void setAuditService(AuditService auditService);

    public PaymentSource readPaymentSource(Long paymentSourceId);

    public PaymentSource findPaymentSourceProfile(Long personId, String profile);
}
