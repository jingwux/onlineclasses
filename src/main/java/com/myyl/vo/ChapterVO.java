package com.myyl.vo;

import lombok.Data;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Data
public class ChapterVO {

    private String cpid;

    private String cpname;

    private String intro;

    private String cid;

    private String flag;

    private String remark;

    private String cname;

    /**
     * chapter video name
     */
    private String filename;

    /**
     * real path/course name
     */
    private String filepath;

}
