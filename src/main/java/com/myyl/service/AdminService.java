package com.myyl.service;

import com.myyl.pojo.Admin;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface AdminService {

    Admin loginCheck(String name, String pwd); //验证用户名密码是否正确

    Admin getAdminInfoById(String id); //通过id获取管理员信息

}
