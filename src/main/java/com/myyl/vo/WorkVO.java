package com.myyl.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Data
public class WorkVO {

    private String uname;

    private Integer wid;

    private String wname;

    private Integer score;

    private String cid;

    private String uid;

    private String remark;

    private String filename;

    private String filepath;
}
