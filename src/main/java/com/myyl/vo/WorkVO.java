package com.myyl.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

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
