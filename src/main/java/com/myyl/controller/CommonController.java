package com.myyl.controller;

import com.myyl.util.CaptchaUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

@Controller
@RequestMapping("/")
public class CommonController {

    @RequestMapping("error")
    public ModelAndView error(ModelAndView modelAndView) {
        modelAndView.addObject("", "");
        modelAndView.setViewName("common/error");
        return modelAndView;
    }

    @RequestMapping("404")
    public ModelAndView requestNotFind(ModelAndView modelAndView) {
        modelAndView.addObject("", "");
        modelAndView.setViewName("common/404");
        return modelAndView;
    }

    @RequestMapping("500")
    public ModelAndView serverError(ModelAndView modelAndView) {
        modelAndView.addObject("", "");
        modelAndView.setViewName("common/500");
        return modelAndView;
    }

    @RequestMapping("captcha")
    public void captcha(HttpSession session, HttpServletResponse response) {
        Map<String, Object> captcha = CaptchaUtil.createCaptcha();

        session.setAttribute("code", captcha.get("code").toString());

        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", -1);
        response.setContentType("image/jpeg");
        OutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            ImageIO.write((RenderedImage) captcha.get("pic"), "jpeg", outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
                outputStream.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

}
