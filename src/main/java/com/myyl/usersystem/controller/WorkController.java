package com.myyl.usersystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.Exercise;
import com.myyl.pojo.Selectcourse;
import com.myyl.pojo.User;
import com.myyl.pojo.Work;
import com.myyl.service.ExerciseService;
import com.myyl.service.SelectCourseService;
import com.myyl.service.WorkService;
import com.myyl.vo.CourseVO;
import com.myyl.vo.WorkVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

@Controller
public class WorkController {

    @Autowired
    private WorkService workService;
    @Autowired
    private SelectCourseService selectCourseService;
    private BufferedOutputStream out;

    @RequestMapping(value = "/course/work")
    @ResponseBody
    public ResultData uploadWork(String cid, CourseVO courseVO, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String path = "F:/Temp/Upload/Img";
        Work work = new Work();
        work.setFilepath(path);
        work.setUid(user.getUid());
        MultipartFile multipartFile = courseVO.getFile();
        String filename = multipartFile.getOriginalFilename();
        File file = new File(path, filename);
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        work.setCid(cid);
        //exercise.setStatus("1");
        work.setFilename(filename);
        work.setWname(filename);
        workService.addWork(work);

        return new ResultData(ResultData.SUCCESS);
    }

    @RequestMapping(value = "/teacher/course/checkWork")
    @ResponseBody
    public ResultData teacherCheckWork(String cid) {
        List<WorkVO> list = workService.getWorkInfo(cid);

        return new ResultData(true,list);
    }

    @RequestMapping(value = "/teacher/workDownload", method = RequestMethod.GET)
    @ResponseBody
    public ResultData workDownload(@RequestParam(value = "filename") String filename,
                                       HttpServletResponse response) throws IOException {
        //  文件真实路径不能放在前台现实，后台用一个固定常量 保存，然后手动拼接路径
        InputStream bis = new BufferedInputStream(new FileInputStream(new File("F:/Temp/Upload/Img", filename)));
        filename = new String(filename.getBytes(),"ISO8859-1");
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        response.setContentType("multipart/form-data");
        out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while ((len = bis.read()) != -1) {
            out.write(len);
        }
        out.close();
        out.flush();
        return new ResultData(ResultData.SUCCESS);
    }

    @RequestMapping(value = "/teacher/score")
    @ResponseBody
    public ResultData score(@RequestParam(value = "score") String score, @RequestParam(value = "uid") String uid,
                            @RequestParam(value = "cid") String cid) {
        Work work = new Work();
        work.setScore(Integer.parseInt(score));
        workService.updateWork(work, uid, cid);
        return new ResultData(ResultData.SUCCESS);
    }

    @RequestMapping(value = "/student/score")
    @ResponseBody
    public ResultData getScore(String uid, String cid) {
        List<Work> workList = workService.getWorkByCidAndUid(cid, uid);
        ResultData resultData = new ResultData();
        if (!workList.isEmpty() && workList.get(0).getScore() != null) {
            resultData.setSuccess(true);
            resultData.setData(workList.get(0).getScore());
            return resultData;
        }
        resultData.setSuccess(false);
        return resultData;
    }
}
