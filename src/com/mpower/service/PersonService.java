package com.mpower.service;

import java.util.List;
import java.util.Map;

import com.mpower.domain.entity.Person;

public interface PersonService {

    public Person maintainPerson(Person person);

    public Person readByPersonById(Long id);
    
    public Person readPersonByFirstName(String firstName);

    public List<Person> readPersons(Long siteId, Map<String, String> params);

    public Person createDefaultPerson(Long siteId);
    
    public Person matchSpouseLogically(String firstName, String lastName);
}
