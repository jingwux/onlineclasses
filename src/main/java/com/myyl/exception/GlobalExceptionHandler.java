package com.myyl.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局异常处理切面类
 *
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
