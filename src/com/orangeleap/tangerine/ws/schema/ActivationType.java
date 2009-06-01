//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.1-520 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2009.06.01 at 11:22:42 AM CDT 
//


package com.orangeleap.tangerine.ws.schema;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for activationType.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="activationType">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="permanent"/>
 *     &lt;enumeration value="temporary"/>
 *     &lt;enumeration value="seasonal"/>
 *     &lt;enumeration value="unknown"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "activationType")
@XmlEnum
public enum ActivationType {

    @XmlEnumValue("permanent")
    PERMANENT("permanent"),
    @XmlEnumValue("temporary")
    TEMPORARY("temporary"),
    @XmlEnumValue("seasonal")
    SEASONAL("seasonal"),
    @XmlEnumValue("unknown")
    UNKNOWN("unknown");
    private final String value;

    ActivationType(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static ActivationType fromValue(String v) {
        for (ActivationType c: ActivationType.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
