package com.myyl.magsystem.controller;

import com.github.pagehelper.PageInfo;
import com.myyl.common.ResultData;
import com.myyl.pojo.Chapter;
import com.myyl.service.ChapterService;
import com.myyl.vo.ChapterVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@Controller
@RequestMapping("/chapterManage")
public class ChapterManageController {

    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/listChapter")
    @ResponseBody
    public ResultData listChapter(@RequestParam("pageIndex") Integer pageIndex, @RequestParam("pageSize") Integer pageSize) {
        PageInfo<ChapterVO> chapters = chapterService.getChapterByPage(pageIndex, pageSize);
        return new ResultData(ResultData.SUCCESS, chapters);
    }

    @RequestMapping("/listChapter/{chapterInfo}")
    @ResponseBody
    public ResultData listChapter(@PathVariable String chapterInfo) {
        List<ChapterVO> chapters = chapterService.selectByExample(chapterInfo);
        return new ResultData(ResultData.SUCCESS, chapters);
    }

    @RequestMapping("/listLv1Chapter/{cid}")
    @ResponseBody
    public ResultData listLv1Chapter(@PathVariable String cid) {
        List<ChapterVO> chapters = chapterService.getLv1Chapter(cid);
        return new ResultData(ResultData.SUCCESS, chapters);
    }

    @RequestMapping("/findChapter")
    @ResponseBody
    public ResultData listChapterByCourse(@RequestParam("pageIndex") Integer pageIndex, @RequestParam("pageSize") Integer pageSize,
                                          @RequestParam("info") String chapterInfo) {
        PageInfo<ChapterVO> chapters = chapterService.getChapterByCourseName(pageIndex, pageSize, chapterInfo);
        return new ResultData(ResultData.SUCCESS, chapters);
    }


    @RequestMapping("/deleteChapter/{cpid}")
    @ResponseBody
    public ResultData deleteChapter(@PathVariable String cpid) {
        ResultData resultData = new ResultData();
        try {
            chapterService.deleteByPrimaryKey(cpid);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }

    @RequestMapping("/updateChapter")
    @ResponseBody
    public ResultData updateChapter(Chapter chapter) {
        ResultData resultData = new ResultData();
        try {
            chapterService.updateByPrimaryKey(chapter);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }


    @RequestMapping("/addChapter")
    @ResponseBody
    public ResultData addChapter(Chapter chapter) {
        ResultData resultData = new ResultData();
        try {
            chapterService.insert(chapter);
            resultData.setSuccess(ResultData.SUCCESS);
        } catch (Exception e) {
            resultData.setMessage(e.getMessage());
        }
        return resultData;
    }


    @RequestMapping("/bindVideo/{cid}")
    @ResponseBody
    public ResultData bindVideo(@PathVariable String cid) {
        ResultData resultData = new ResultData();
        String path = "C:\\Users\\liyunli\\Desktop\\project\\onlineclasses\\src\\main\\webapp\\WEB-INF\\static\\video";
        File file = new File(path, cid);
        File[] files = file.listFiles();
        List<String> list = new ArrayList<>();
        for (File f : files) {
            list.add(f.getName());
        }
        resultData.setData(list);
        resultData.setSuccess(ResultData.SUCCESS);
        return resultData;
    }


}
