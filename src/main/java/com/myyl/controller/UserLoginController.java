package com.myyl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/online")
public class UserLoginController {

    @RequestMapping("/login/page")
    public String loginPage() {
        return "usersystem/login";
    }

    @RequestMapping("/login")
    public String login(String name,String pwd) {
        String uname =name;
        if(name.equals(pwd)){
            return "index";
        }
        return "usersystem/msg";
    }
}
