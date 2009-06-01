package com.orangeleap.tangerine.type;

import javax.xml.bind.annotation.XmlType;

@XmlType (namespace="http://www.orangeleap.com/orangeleap/schemas")
public enum PaymentHistoryType {
    UNSPECIFIED,
    GIFT,
    ADJUSTED_GIFT,
    MEMBERSHIP,
    ORDER
}