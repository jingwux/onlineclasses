package com.myyl.usersystem.controller;

import com.myyl.common.ResultData;
import com.myyl.constant.RegisterActivateEnum;
import com.myyl.constant.RegisterTypeEnum;
import com.myyl.constant.ResultCodeEnum;
import com.myyl.exception.UserActivatedException;
import com.myyl.exception.UserInfoIsNullException;
import com.myyl.exception.UserInsertException;
import com.myyl.pojo.User;
import com.myyl.service.UserService;
import com.myyl.util.MailUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.UUID;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@Controller
@RequestMapping("/user/register")
public class RegisterController {

    @Autowired
    private UserService userService;

    /**
     * 加载邮箱注册页面
     *
     * @return
     */
    @RequestMapping("/emailRegister")
    public String emailRegister() {
        return "usersystem/emailRegister";
    }

    /**
     * 加载手机号码注册页面
     *
     * @return
     */
    @RequestMapping("/telRegister")
    public String telRegister() {
        return "usersystem/telRegister";
    }

    /**
     * 注册
     *
     * @param user 用户信息
     * @param type 注册方式
     * @return
     */
    @PostMapping("/register")
    public @ResponseBody
    ResultData doRegister(User user, String type, String captcha, HttpSession session) {
        user.setUid(String.valueOf(new Date().getTime()));    //生成uid
        if ("email".equals(type)) {
            user.setValidatecode(UUID.randomUUID().toString()); //邮箱激活码
            user.setRemark(RegisterTypeEnum.REGISTER_BY_EMAIL.getType()); //邮箱注册方式标记
            user.setStatus(RegisterActivateEnum.NOT_ACTIVATED.getValue()); //邮箱未激活状态

        } else if ("tel".equals(type)) {
            user.setRemark(RegisterTypeEnum.REGISTER_BY_TEL.getType());//电话注册方式标记
            user.setStatus(RegisterActivateEnum.ACTIVATED.getValue());
        }

        try {
            if (!StringUtils.equalsIgnoreCase(captcha, (String) session.getAttribute("code"))) {
                return new ResultData(ResultData.NOT_SUCCESS, ResultCodeEnum.ERROR_CAPTCHA);
            }
            // 插入用户
            userService.addUser(user);
            if (StringUtils.isNotEmpty(user.getEmail())) {
                MailUtil.sendMail(user); // 发送邮件
            }

            return new ResultData(ResultData.SUCCESS);

        } catch (UserInsertException e) {
            log.error(e.getMessage());
            return new ResultData(ResultData.NOT_SUCCESS, e.getResultCodeEnum());
        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResultData(ResultData.NOT_SUCCESS, ResultCodeEnum.USER_INSERT_ERROR);

        }

    }

    /**
     * 用户名，注册账号唯一性检查
     *
     * @param name
     * @param email
     * @return
     */
    @PostMapping("/check")
    @ResponseBody
    public ResultData registerCheck(String name, String email) {
        boolean existUname = false;
        boolean existEmail = false;

        if (StringUtils.isNotEmpty(name)) {
            existUname = userService.isExistUname(name);
        }
        if (StringUtils.isNotEmpty(email)) {
            existEmail = userService.isExistEmail(email);
        }
        ResultData resultData = new ResultData();
        // 用户名或者邮箱已存在
        if (existUname || existEmail) {
            resultData.setSuccess(ResultData.NOT_SUCCESS);
            resultData.setMessage(ResultCodeEnum.USER_ALREADY_EXIST.getResultMessage());
            resultData.setCode(ResultCodeEnum.USER_ALREADY_EXIST.getResultCode());
            return resultData;
        }
        return resultData;

    }

    @PostMapping("/checkCaptcha/{captcha}")
    @ResponseBody
    public ResultData registerCheck(@PathVariable String captcha, HttpSession session) {
        if (StringUtils.equalsIgnoreCase(captcha, (CharSequence) session.getAttribute("code"))) {
            return new ResultData(ResultData.SUCCESS);
        }
        return new ResultData(ResultData.NOT_SUCCESS,ResultCodeEnum.ERROR_CAPTCHA);
    }

    /**
     * 邮件激活
     *
     * @param uid
     * @param code
     * @return
     */
    @GetMapping("/active/{uid}/{code}")
    public String activate(RedirectAttributes redirectAttributes, @PathVariable("uid") String uid, @PathVariable("code") String code) {
        try {
            userService.activeUser(uid, code);
            redirectAttributes.addFlashAttribute("msg", "激活成功");
            return "redirect:/user/register/active";
        } catch (UserInfoIsNullException | UserActivatedException e) {
            log.error(e.getMessage());
            redirectAttributes.addFlashAttribute("clazz", "failed");
            redirectAttributes.addFlashAttribute("msg", e.getMessage());
            return "redirect:/user/register/active";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "redirect:/error";
        }
    }

    @RequestMapping("/active")
    public String active(ModelMap map, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("msg", map.get("msg"));
        return "/usersystem/active";
    }


}
