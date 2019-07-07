package com.myyl.usersystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.User;
import com.myyl.service.UserService;
import com.myyl.vo.UserVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Controller
public class UserSettingController {

    @Autowired
    private UserService userService;

    @RequestMapping("/user/updateInfo")
    public String updateInfo(User user) {
        userService.updateInfo(user);
        return "usersystem/setting";
    }

    /**
     * 上传头像
     *
     * @param user
     * @return
     */
    @RequestMapping("/user/updateAvatar")
    public ResultData updateAvatar(UserVO user) {
        ResultData resultData = new ResultData();
        // TODO 更改路径
        String path = "F:/Temp/Upload/Img";
        try {
            MultipartFile multipartFile = user.getFile();
            String filename = multipartFile.getOriginalFilename();
            File file = new File(path, filename);
            multipartFile.transferTo(file);
            User u = new User();
            BeanUtils.copyProperties(user, u);
            u.setHeadimg(filename);
            userService.updateInfo(u);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setSuccess(ResultData.NOT_SUCCESS);
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }


    @RequestMapping("/user/setting/updatePwd")
    @ResponseBody
    public ResultData updatePwd(@RequestParam(value = "uid") String uid, @RequestParam(value = "pwd") String pwd) {
        userService.updatePwd(uid, pwd);
        //"redirect:/user/login/index";

        return new ResultData(ResultData.SUCCESS);
    }

    @RequestMapping("/user/setting/checkOldPwd")
    @ResponseBody
    public ResultData checkOldPwd(String oldpassword, String uid) {
        boolean b = userService.checkOldPwd(uid, oldpassword);
        if (b) {
            return new ResultData(ResultData.SUCCESS, "验证通过");
        } else {
            return new ResultData(ResultData.NOT_SUCCESS, "旧密码错误");
        }
    }
}
