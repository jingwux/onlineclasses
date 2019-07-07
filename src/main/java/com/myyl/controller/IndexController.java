package com.myyl.controller;

import com.myyl.pojo.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping({"/", "/index"})
    public String index() {
        return "/index";
    }

    @RequestMapping("/exit")
    public String logout(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        //清除session
        session.invalidate();
        //重定向到登录页面的跳转方法

        return admin == null ? "redirect:index" : "redirect:manage/index";
    }


}
