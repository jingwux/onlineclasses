package com.myyl.vo;

import lombok.Data;

import java.util.Set;

@Data
public class QuestionVO {

    private String qid;
    private String uid;
    private String qname;
    private String cid;

    private String content;

    private Set<CommentVO> comments;

}
