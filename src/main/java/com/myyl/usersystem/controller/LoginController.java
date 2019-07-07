package com.myyl.usersystem.controller;

import com.myyl.constant.ResultCodeEnum;
import com.myyl.exception.CaptchaErrorException;
import com.myyl.exception.UserInfoIsNullException;
import com.myyl.exception.UserNotExistException;
import com.myyl.pojo.User;
import com.myyl.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@Controller
@RequestMapping("/user/login")
public class LoginController {

    /**
     *
     */
    @Autowired
    private UserService userService;

    /**
     * 加载首页
     *
     * @return
     */
    @RequestMapping({"/", "/index"})
    public String loginPage() {
        return "usersystem/login";
    }

    /**
     * 登陆
     *
     * @param session
     * @param name
     * @param pwd
     * @param redirectAttributes
     * @return
     */
    @PostMapping("/login")
    public String doLogin(HttpSession session, String name, String pwd, String captcha, RedirectAttributes redirectAttributes) {
        boolean flag;
        User user;

        //判断
        try {
            if (StringUtils.isBlank(name) || StringUtils.isBlank(pwd) || StringUtils.isBlank(captcha)) {
                throw new UserInfoIsNullException(ResultCodeEnum.EMPTY_INPUT);
            }

            if (!StringUtils.equalsIgnoreCase(captcha, (String) session.getAttribute("code"))) {
                throw new CaptchaErrorException(ResultCodeEnum.ERROR_CAPTCHA);
            }

            log.info("登陆信息检查");
            user = userService.loginCheck(name, pwd);
            flag = user != null;

            if (flag) {
                log.info("用户存在，允许登录 ");
                session.setAttribute("user", user);
                return "redirect:/index";
            } else {
                log.error("用户不存在，不允许登录");
                throw new UserNotExistException(ResultCodeEnum.USER_ERROR);
            }

        } catch (UserNotExistException e) {
            redirectAttributes.addFlashAttribute("msg", e.getResultCodeEnum().getResultMessage());
            redirectAttributes.addFlashAttribute("name", name);
            return "redirect:/user/login/index";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("msg", e.getMessage());
            redirectAttributes.addFlashAttribute("name", name);
            return "redirect:/user/login/index";
        }

    }

    /**
     * 注销
     *
     * @param session
     * @return
     */
    @RequestMapping("/exit")
    public String exit(HttpSession session) {
        session.removeAttribute("user");
        return "index";
    }


    /**
     * 忘记密码
     *
     * @return
     */
    @RequestMapping("/forgetPwd")
    public String forgetPwd() {
        return "usersystem/forgetPwd";
    }


}
