package com.myyl.usersystem.controller;

import com.myyl.pojo.User;
import com.myyl.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class RegisterControllerTest {

    @Autowired
    private UserService userService;

    @Test
    public void doRegister() {

        System.out.println(userService);

        User user = new User();
        user.setUname("Myyl");
        user.setEmail("1371694630@qq.com");
        user.setPassword("123456.");
        RegisterController registerController = new RegisterController();
//        ResultData resultData = registerController.doRegister(user, "email");

//        System.out.println(resultData);

    }
}