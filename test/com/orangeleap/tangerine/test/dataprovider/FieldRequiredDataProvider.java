package com.orangeleap.tangerine.test.dataprovider;

import org.testng.annotations.DataProvider;

import com.orangeleap.tangerine.domain.Site;
import com.orangeleap.tangerine.domain.customization.FieldDefinition;
import com.orangeleap.tangerine.domain.customization.FieldRequired;
import com.orangeleap.tangerine.domain.customization.SectionDefinition;
import com.orangeleap.tangerine.domain.customization.SectionField;

public class FieldRequiredDataProvider {

    @DataProvider(name = "testFieldRequired")
    public static Object[][] provideFieldRequired() {
        Site site1 = new Site();
        site1.setName("site 1");

        SectionDefinition sectionDefinition = new SectionDefinition();
        sectionDefinition.setSectionName("section 1");
        sectionDefinition.setDefaultLabel("section 1");

        SectionField sectionField = new SectionField();
        sectionField.setSectionDefinition(sectionDefinition);

        FieldDefinition fieldDefinition = new FieldDefinition();
        fieldDefinition.setFieldName("field 1");
        fieldDefinition.setId("field 1");
        fieldDefinition.setDefaultLabel("field 1");

        FieldRequired defaultField = new FieldRequired();
        defaultField.setSectionName(sectionField.getSectionDefinition().getSectionName());
        defaultField.setFieldDefinition(fieldDefinition);
        defaultField.setRequired(false);

        FieldRequired modifiedField = new FieldRequired();
        modifiedField.setSectionName(sectionField.getSectionDefinition().getSectionName());
        modifiedField.setFieldDefinition(fieldDefinition);
        modifiedField.setRequired(true);

        return new Object[][] { new Object[] { site1, fieldDefinition, sectionDefinition, sectionField, defaultField, modifiedField, true } };
    }
}
