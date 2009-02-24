package com.mpower.dao.interfaces;

import java.util.List;

import com.mpower.domain.model.Person;

public interface ConstituentDao {

    public Person readConstituentById(Long id);

    public List<Person> readAllConstituentsBySite();

    public Person readConstituentByLoginId(String loginId);

    public List<Person> readConstituentsByIds(List<Long> ids);

}
