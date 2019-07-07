package com.myyl.usersystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.Data;
import com.myyl.service.DataService;
import com.myyl.vo.DataVO;
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


/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */

 
@Controller
public class DataController {
    @Autowired
    private DataService dataService;
    private BufferedOutputStream out;

    @RequestMapping(value = "/data/upload")
    @ResponseBody
    public ResultData exercise(DataVO dataVO, HttpSession session) {
        String path = "F:/Temp/Upload/Img";
        Data newData = new Data();
        newData.setDid(String.valueOf(new Date().getTime()));
        newData.setDname(dataVO.getDname());
        newData.setCid(dataVO.getCid());
        MultipartFile multipartFile = dataVO.getFile();
        String filename = multipartFile.getOriginalFilename();
        File file = new File(path, filename);
        newData.setDname(filename);
        try {
            multipartFile.transferTo(file);
            dataService.addData(newData);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new ResultData(ResultData.SUCCESS);
    }

    @RequestMapping(value = "/courseData/download", method = RequestMethod.GET)
    @ResponseBody
    public ResultData dataDownload(@RequestParam(value = "filename") String filename,
                                   HttpServletResponse response) throws IOException {
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
}
