package com.myyl.service;

import com.github.pagehelper.PageInfo;
import com.myyl.exception.UserNotExistException;
import com.myyl.pojo.User;
import com.myyl.vo.UserVO;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public interface UserService {


    User loginCheck(String loginToken, String pwd) throws UserNotExistException;

    User getInfoBySid(String id); //根据学号获取学生个人信息

    int addUser(User user); //添加用户

    int activeUser(String uid, String validateCode); //激活用户

    int updateInfo(User user); //修改个人资料

    boolean checkOldPwd(String uid, String password); //检查旧密码是否正确

    int updatePwd(String uid, String password); //修改密码

    int findPwd(String tel, String password); //忘记密码找回


    boolean isExistUname(String uname); //检验用户名是否已被注册

    boolean isExistEmail(String email); //检验邮箱是否已被注册

    boolean isExistTel(String tel); //检验手机号是否已被注册


    List<User> getTeacherFive(); //获取5位名师

    PageInfo<UserVO> getUserInfo(Integer pageIndex, Integer pageSize, String info); //获取用户信息

    User getUserInfoById(String info); //通过id获取用户信息

    int deleteUser(String uid); //删除用户

    PageInfo<UserVO> getUserByPage(int pageIndex, int pageSize);

    PageInfo<UserVO> getUserByRole(int pageIndex, int pageSize,int role);

    PageInfo<UserVO> getUserByRoleAndInfo(int pageIndex, int pageSize,int role,String info);


}
