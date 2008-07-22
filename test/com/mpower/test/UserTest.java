package com.mpower.test;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import com.mpower.domain.User;
import com.mpower.service.UserService;

public class UserTest extends BaseTest {

    private UserService userService;

    @Test(groups = { "user" })
    public void insertUser() {
        User user = new User();
        user.setUserName("kelly");
        user = userService.maintainUser(user);
    }

    @Test(groups = { "user" }, dependsOnMethods = { "insertUser" })
    public void readUser() {
        User user = userService.authenticateUser("kelly", null);
        assert user != null;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @BeforeClass
    public void setup() {
        userService = (UserService) applicationContext.getBean("userService");
    }
}
