package com.myyl.magsystem.controller;

import com.github.pagehelper.PageInfo;
import com.myyl.common.ResultData;
import com.myyl.pojo.User;
import com.myyl.service.CourseService;
import com.myyl.service.UserService;
import com.myyl.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@RestController
@RequestMapping("/userManage")
public class UserManageController {

    @Autowired
    private UserService userService;

    @RequestMapping("/listUser")
    public ResultData listUser(@RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        ResultData resultData = new ResultData();
        PageInfo<UserVO> userVOPageInfo = userService.getUserByPage(pageIndex, pageSize);
        resultData.setData(userVOPageInfo);
        return resultData;
    }

    @RequestMapping("/listUserByCondition")
    public ResultData listUserByCondition(@RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize,
                                          @RequestParam(value = "info", required = false) String info, @RequestParam(value = "role", required = false) int role) {
        ResultData resultData = new ResultData();
        PageInfo<UserVO> userInfo;
        if (StringUtils.isNotBlank(info)) {
            userInfo = userService.getUserByRoleAndInfo(pageIndex, pageSize, role, info);
        } else {
            userInfo = userService.getUserByRole(pageIndex, pageSize, role);
        }
        resultData.setData(userInfo);
        return resultData;
    }

    @RequestMapping("/updateUser")
    public ResultData updateUserByCondition(User user) {
        ResultData resultData = new ResultData();
        try {
            userService.updateInfo(user);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setSuccess(ResultData.NOT_SUCCESS);
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }


    @RequestMapping("/addTeacher/{uid}")
    public ResultData addTeacher(@PathVariable String uid) {
        ResultData resultData = new ResultData();
        try {
            User teacher = userService.getUserInfoById(uid);
            teacher.setRole(CourseService.TEACHER);
            userService.updateInfo(teacher);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setSuccess(ResultData.NOT_SUCCESS);
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }

    @RequestMapping("/deleteUser/{uid}")
    public ResultData deleteUserByCondition(@PathVariable String uid) {
        ResultData resultData = new ResultData();
        try {
            userService.deleteUser(uid);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setSuccess(ResultData.NOT_SUCCESS);
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }


}
