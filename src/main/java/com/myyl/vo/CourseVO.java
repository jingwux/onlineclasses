package com.myyl.vo;

import com.myyl.pojo.User;
import lombok.Data;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.Set;

@Data
@ToString(exclude = {"users","files"})
public class CourseVO {

    public static final Integer  APPLY = 0;

    public static final Integer  APPROVED = 1;

    public static final Integer  NOT_APPROVED = 2;

    private String cid;

    private String cname;

    private String uid;

    private String startime;

    private String updatetime;

    private String intro;

    private String content;

    private String typeid;


    private String typeName;

    private String typeDirection;

    private String courseimg;

    private String files;

    private Integer accessnum;

    private String remark;

    private Integer status;     //1 激活， 0 未激活， 2 已拒绝

    private String teacherId;

    private String teacherName;

    private MultipartFile file;

    //学生总数
    private String total;

    //选课的学生
    private Set<User> users;
}
