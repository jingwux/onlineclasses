package com.myyl.vo;

import lombok.Data;

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
