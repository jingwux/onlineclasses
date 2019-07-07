package com.myyl.magsystem.controller;

import com.myyl.common.ResultData;
import com.myyl.vo.CourseVO;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:applicationContext*.xml")
@WebAppConfiguration
public class CourseManageControllerTest {

    @Autowired
    protected WebApplicationContext wac;

    protected MockMvc mockMvc;

    @Before
    public void setUp() throws Exception {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }

    @Test
    public void listCourse() {
        try {
            MvcResult mvcResult = mockMvc.perform(get("/courseManage/listCourse")
                    .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                    .param("pageIndex", "1")
                    .param("pageSize", "5"))
                    .andExpect(status().isOk())
                    //.andDo(print())
                    .andReturn();
            String  s = mvcResult.getResponse().getContentAsString();
            System.out.println(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void listCourse2() {
        try {
            MvcResult mvcResult = mockMvc.perform(get("/courseManage/listCourse")
                    .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                    .param("pageIndex", "1")
                    .param("pageSize", "5"))
                    .andExpect(status().isOk())
                    .andReturn();

            String contentAsString = mvcResult.getResponse().getContentAsString();
            System.out.println(contentAsString);

            ResultData resultData = (ResultData) mvcResult.getModelAndView().getModel().get("resultData");
            System.out.println(resultData);
            List<CourseVO> data = (List<CourseVO>) resultData.getData();
            System.out.println(data.size());
//            for (Course course : data) {
//                System.out.println(course);
//            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    @Test
    public void listCourse3() {
        try {
            MvcResult mvcResult = mockMvc.perform(get("/courseManage/listCourse/"))
                    .andExpect(status().isOk())
                    .andReturn();

            String contentAsString = mvcResult.getResponse().getContentAsString();
            System.out.println(contentAsString);

            ResultData resultData = (ResultData) mvcResult.getModelAndView().getModel().get("resultData");
            System.out.println(resultData);
            List<CourseVO> data = (List<CourseVO>) resultData.getData();
            System.out.println(data.size());
//            for (Course course : data) {
//                System.out.println(course);
//            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }



}