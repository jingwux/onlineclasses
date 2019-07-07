package com.myyl.magsystem.controller;

import com.myyl.common.ResultData;
import com.myyl.pojo.Data;
import com.myyl.service.DataService;
import com.myyl.vo.DataVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description:
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


@Slf4j
@Controller
public class DataManageController {

    @Autowired
    private DataService dataService;

    @RequestMapping(value="/course/data")
    @ResponseBody
    public ResultData getData() {
        ResultData resultData = new ResultData();
        List<DataVO> allData = dataService.findAllData();
        resultData.setData(allData);
        resultData.setSuccess(true);
        return resultData;
    }


}
