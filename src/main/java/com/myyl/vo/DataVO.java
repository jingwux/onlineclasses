package com.myyl.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class DataVO {
    private String did;
    private String dname;
    private String cid;
    private String cname;
    private MultipartFile file;

}
