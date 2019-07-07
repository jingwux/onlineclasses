package com.myyl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myyl.constant.RegisterActivateEnum;
import com.myyl.constant.ResultCodeEnum;
import com.myyl.exception.UserActivatedException;
import com.myyl.exception.UserInfoIsNullException;
import com.myyl.exception.UserInsertException;
import com.myyl.exception.UserNotExistException;
import com.myyl.mapper.UserMapper;
import com.myyl.pojo.User;
import com.myyl.pojo.UserExample;
import com.myyl.service.UserService;
import com.myyl.vo.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public User loginCheck(String loginToken, String pwd) {
        UserExample userExample = new UserExample();

        // where (tel="15073051134" AND `PASSWORD` = "123456") or (email = "15073051134" AND `PASSWORD` = "123456")
        userExample.or().andUidEqualTo(loginToken).andPasswordEqualTo(pwd);
        userExample.or().andEmailEqualTo(loginToken).andPasswordEqualTo(pwd);
        userExample.or().andTelEqualTo(loginToken).andPasswordEqualTo(pwd);
        List<User> userList = userMapper.selectByExample(userExample);

        if (!userList.isEmpty()) {
            return userList.get(0);
        } else {
            throw new UserNotExistException(ResultCodeEnum.USER_ERROR);
        }
    }


    @Override
    public User getInfoBySid(String id) {
        return null;
    }

    @Override
    public int addUser(User user) {
        int res = userMapper.insertSelective(user);
        if (res == 0) {
            throw new UserInsertException(ResultCodeEnum.USER_INSERT_ERROR);
        }
        return res;
    }

    @Override
    public int activeUser(String uid, String validateCode) {
        UserExample userExample = new UserExample();
        userExample.or().andUidEqualTo(uid).andValidatecodeEqualTo(validateCode);
        List<User> userList = userMapper.selectByExample(userExample);
        User user;
        // 用户已注册，未激活
        if (!userList.isEmpty()) {
            user = userList.get(0);
            user.setValidatecode("");
            // 已激活
            if (user.getStatus() == RegisterActivateEnum.ACTIVATED.getValue()) {
                throw new UserActivatedException(ResultCodeEnum.USER_ACTIVATED);
            } else {
                user.setStatus(RegisterActivateEnum.ACTIVATED.getValue());
            }

            return userMapper.updateByExampleSelective(user, userExample);
        } else {
            throw new UserInfoIsNullException(ResultCodeEnum.USER_INSERT_ERROR);
        }


    }

    @Override
    public int updateInfo(User user) {
        UserExample userExample = new UserExample();
        userExample.or().andUidEqualTo(user.getUid());
        return userMapper.updateByExampleSelective(user, userExample);
    }

    @Override
    public boolean checkOldPwd(String uid, String password) {
        User user = userMapper.selectByPrimaryKey(uid);
        return user.getPassword().equals(password);
    }

    @Override
    public int updatePwd(String uid, String password) {
        User user = userMapper.selectByPrimaryKey(uid);
        user.setPassword(password);
        return userMapper.updateByPrimaryKeySelective(user);

    }

    @Override
    public int findPwd(String tel, String password) {
        return 0;
    }

    @Override
    public boolean isExistUname(String uname) {
        UserExample userExample = new UserExample();
        userExample.or().andUnameEqualTo(uname);
        List<User> userList = userMapper.selectByExample(userExample);

        return !userList.isEmpty();
    }

    @Override
    public boolean isExistEmail(String email) {
        UserExample userExample = new UserExample();
        userExample.or().andEmailEqualTo(email);
        List<User> userList = userMapper.selectByExample(userExample);

        return !userList.isEmpty();
    }

    @Override
    public boolean isExistTel(String tel) {
        return true;
    }

    @Override
    public List<User> getTeacherFive() {
        return null;
    }

    @Override
    public PageInfo<UserVO> getUserInfo(Integer pageIndex, Integer pageSize, String info) {
        PageHelper.startPage(pageIndex, pageSize);
        info = "%" + info + "%";
        UserExample userExample = new UserExample();
        userExample.or().andUnameLike(info);
        userExample.or().andEmailLike(info);
        userExample.or().andUidLike(info);
        List<User> users = userMapper.selectByExample(userExample);
        return new PageInfo<>(getUserVO(users));
    }

    @Override
    public User getUserInfoById(String uid) {

        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public int deleteUser(String uid) {
        return userMapper.deleteByPrimaryKey(uid);
    }


    @Override
    public PageInfo<UserVO> getUserByPage(int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        UserExample userExample = new UserExample();
        List<User> users = userMapper.selectByExample(userExample);

        return new PageInfo<>(getUserVO(users));
    }

    @Override
    public PageInfo<UserVO> getUserByRole(int pageIndex, int pageSize, int role) {
        PageHelper.startPage(pageIndex, pageSize);
        UserExample userExample = new UserExample();
        userExample.or().andRoleEqualTo(role);
        List<User> users = userMapper.selectByExample(userExample);
        return new PageInfo<>(getUserVO(users));
    }

    @Override
    public PageInfo<UserVO> getUserByRoleAndInfo(int pageIndex, int pageSize, int role, String info) {
        PageHelper.startPage(pageIndex, pageSize);
        UserExample userExample = new UserExample();
        if (StringUtils.isNotBlank(info) && 0 != role) {
            info = "%" + info + "%";
            userExample.or().andUnameLike(info).andRoleEqualTo(role);
            userExample.or().andEmailLike(info).andRoleEqualTo(role);
            userExample.or().andUidLike(info).andRoleEqualTo(role);
            userExample.or().andTelLike(info).andRoleEqualTo(role);
        } else {
            info = "%" + info + "%";
            userExample.or().andUnameLike(info);
            userExample.or().andEmailLike(info);
            userExample.or().andUidLike(info);
            userExample.or().andTelLike(info);
        }
        List<User> users = userMapper.selectByExample(userExample);
        return new PageInfo<>(getUserVO(users));
    }

    private List<UserVO> getUserVO(List<User> users) {
        List<UserVO> userVOList = new ArrayList<>();
        for (User user : users) {
            UserVO userVO = new UserVO();
            BeanUtils.copyProperties(user, userVO);
            userVOList.add(userVO);
        }
        return userVOList;
    }

}
