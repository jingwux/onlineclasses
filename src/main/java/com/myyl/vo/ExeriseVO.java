package com.myyl.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Data
public class ExeriseVO {

    private String eid;

    private String ename;

    private Date startime;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date endtime;

    private String demand;

    private String content;

    private String attachment;

    private String score;

    private String status;

    private String pareid;

    private String uid;

    private String remark;

    private MultipartFile file;

    private String cid;

}
