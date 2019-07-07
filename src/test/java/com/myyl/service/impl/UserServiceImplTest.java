package com.myyl.service.impl;

import com.myyl.exception.UserNotExistException;
import com.myyl.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext.xml")
public class UserServiceImplTest {

    @Autowired
    private UserService userService;

    @Test
    public void loginCheck() {
        String loginToken = "1371694630@qq.com";
        String pwd = "123456";

        try {
            boolean flag = userService.loginCheck(loginToken, pwd)!=null;
            System.out.println(flag);
        } catch (UserNotExistException e) {
//            ResultData resultData = new ResultData(e.getErrorCode(), e.getMessage());
//            System.out.println(resultData.getCode());
//            System.out.println(resultData.getMessage());
        }

    }

    @Test
    public void activeUser() {
        int i = userService.activeUser("1", "1");
        System.out.println(i);

    }
}