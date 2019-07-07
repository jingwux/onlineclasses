package com.myyl.service.impl;

import com.myyl.constant.ResultCodeEnum;
import com.myyl.exception.UserNotAdminException;
import com.myyl.exception.UserNotExistException;
import com.myyl.mapper.AdminMapper;
import com.myyl.pojo.Admin;
import com.myyl.pojo.AdminExample;
import com.myyl.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin loginCheck(String name, String pwd) {
        AdminExample adminExample = new AdminExample();
        adminExample.or().andAnameEqualTo(name).andPasswordEqualTo(pwd);
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        if (admins.isEmpty() || admins.get(0) == null) {
            throw new UserNotAdminException(ResultCodeEnum.USER_NOT_ADMIN);
        }
        return admins.get(0);
    }

    @Override
    public Admin getAdminInfoById(String id) {
        Admin admin;
        admin = adminMapper.selectByPrimaryKey(id);
        if (admin == null) {
            throw new UserNotExistException(ResultCodeEnum.USER_ERROR);
        }
        return admin;
    }
}
