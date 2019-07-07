package com.myyl.vo;

import lombok.Data;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Data
public class CommentVO {

    private String qid;

    private String uid;

    private String cname;

    private String uname;

    private String comid;

    private String content;

    private Integer likenum;

    private String reuid;

    private String remark;


}
