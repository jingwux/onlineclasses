package com.myyl.service.impl;

import com.github.pagehelper.PageInfo;
import com.myyl.common.InitTest;
import com.myyl.service.ChapterService;
import com.myyl.vo.ChapterVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class ChapterServiceImplTest extends InitTest {

    @Autowired
    private ChapterService chapterService;

    @Test
    public void getChapterByCourseName() {
        PageInfo<ChapterVO> chapterByCourseName = chapterService.getChapterByCourseName(1, 10, "C++");

    }
}