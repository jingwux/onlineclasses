package com.myyl.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class UserVO {


    private String cname;

    private String uid;

    private String startime;

    private String updatetime;

    private String intro;

    private String content;

    private String typeid;

    // 课程图片名
    private String courseimg;

    // 课程图片路径
    private String files;

    private String total;

    private String accessnum;


    private String uname;

    private String password;

    private String gender;

    private String age;

    private String address;

    private String profess;

    private String tel;

    private String email;

    private String headimg;

    private MultipartFile file;

    private String contact;

    private String regtime;

    private String validatecode;

    private Integer role;

    private Integer status;

    private String remark;




}
