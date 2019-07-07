package com.myyl.service;

import com.myyl.pojo.Admin;

public interface AdminService {

    Admin loginCheck(String name, String pwd); //验证用户名密码是否正确

    Admin getAdminInfoById(String id); //通过id获取管理员信息

}
