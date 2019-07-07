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
public class DataVO {
    private String did;
    private String dname;
    private String cid;
    private String cname;
    private MultipartFile file;

}
