package com.myyl.vo;

import lombok.Data;

import java.util.Set;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Data
public class QuestionVO {

    private String qid;
    private String uid;
    private String qname;
    private String cid;

    private String content;

    private Set<CommentVO> comments;

}
