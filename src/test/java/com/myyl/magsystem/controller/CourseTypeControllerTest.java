package com.myyl.magsystem.controller;

import com.myyl.common.InitTest;
import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


public class CourseTypeControllerTest extends InitTest {

    @Test
    public void loadCourseType() throws Exception {
        MvcResult mvcResult = mockMvc.perform(get("/manage/getCourseType/0/0")).andExpect(status().isOk()).andDo(print()).andReturn();
        String contentAsString = mvcResult.getResponse().getContentAsString();

        System.out.println(contentAsString);

//        List<Coursetype> coursetypes = (List<Coursetype>) resultData.getData();
//        for (Coursetype result : coursetypes) {
//            System.out.println(result);
//        }

    }
}