package com.myyl.usersystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.Exercise;
import com.myyl.pojo.User;
import com.myyl.service.ExerciseService;
import com.myyl.service.SelectCourseService;
import com.myyl.vo.CourseVO;
import com.myyl.vo.ExeriseVO;
import org.springframework.beans.factory.annotation.Autowired;
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


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Controller
public class ExerciseController {
    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private SelectCourseService selectCourseService;

    private BufferedOutputStream out;

    @RequestMapping(value = "/course/exercise")
    @ResponseBody
    public ResultData uploadExercise(String cid, CourseVO courseVO, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String path = "F:/Temp/Upload/Img";
        Exercise exercise = new Exercise();
        exercise.setAttachment(path);
        exercise.setUid(user.getUid());
        MultipartFile multipartFile = courseVO.getFile();
        String filename = multipartFile.getOriginalFilename();
        File file = new File(path, filename);
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        exercise.setPareid(cid);
        exercise.setStatus("1");
        exercise.setEid(String.valueOf(new Date().getTime()));
        exercise.setEname(filename);
        exerciseService.addExercise(exercise);

        return new ResultData(ResultData.SUCCESS);
    }
    @RequestMapping(value = "/teacher/course/exercise")
    @ResponseBody
    public ResultData teacherExercise(String cid) {
        List<Exercise> list = exerciseService.getExerciseInfo(cid);

        return new ResultData(true,list);
    }

    @RequestMapping(value = "/teacher/exerciseDownload", method = RequestMethod.GET)
    @ResponseBody
    public ResultData exerciseDownload(@RequestParam(value = "filename") String filename,
                                       HttpServletResponse response) throws IOException {
        //  文件真实路径不能放在前台现实，后台用一个固定常量 保存，然后手动拼接路径
        InputStream bis = new BufferedInputStream(new FileInputStream(new File("F:/Temp/Upload/Img", filename)));
        filename = URLEncoder.encode(filename, "UTF-8");
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

//    @RequestMapping(value = "/teacher/score")
//    @ResponseBody
//    public ResultData score(@RequestParam(value = "score") String score, @RequestParam(value = "uid") String uid,
//                            @RequestParam(value = "cid") String cid) {
//        Selectcourse selectCourse = new Selectcourse();
//        selectCourse.setScore(score);
//        selectCourseService.updateSelectCourse(selectCourse, uid, cid);
//        return new ResultData(ResultData.SUCCESS);
//    }


    @RequestMapping(value = "/course/addExercises", method = RequestMethod.POST)
    @ResponseBody
    public ResultData addExercises(ExeriseVO exeriseVO, HttpSession session)  {
        User user = (User) session.getAttribute("user");
        ResultData resultData = new ResultData();
        exeriseVO.setUid(user.getUid());
        exerciseService.addExercise(exeriseVO);
        resultData.setSuccess(ResultData.SUCCESS);
        return resultData;
    }


}
