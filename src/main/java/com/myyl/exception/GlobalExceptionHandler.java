package com.myyl.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: myyl
 * @Time: 2019/5/20 - 13:14
 * @Description: 全局异常处理切面类
 * @See: <a href=" https://github.com/yuanqingx/onlineclasses"> https://github.com/yuanqingx/onlineclasses</a>
 */


public class GlobalExceptionHandler implements HandlerExceptionResolver {


    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

        //TODO

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("",e.getMessage());
        modelAndView.setViewName("common/error");
        return modelAndView;
    }
}
