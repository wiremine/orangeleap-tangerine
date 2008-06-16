package com.mpower.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.mpower.domain.entity.User;

@Repository("userDao")
public class JPAUserDao implements UserDao {
	
	@PersistenceContext
    private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public User readUserByUserNameAndPassword(String userName, String password) {
		Query query = em.createNamedQuery("READ_USER_BY_AND_USERNAME_AND_PASSWORD");
		query.setParameter("userName", userName);
		query.setParameter("password", password);
		
		List<User> result = query.getResultList();
		if (result != null && ! result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public User saveUser(User user) {
		return em.merge(user);
	}
}
