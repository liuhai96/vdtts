package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.pojo.vo.ResultData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomePageController {
/*
 *@Description:
 *@Author:李浪_191019
 *@Param:
 *@return:modelAndView
 *@Date:2020/6/7 14:05
 **/
    @RequestMapping(value = "home")
    public ModelAndView InitHomePage(){
        ResultData resultData = new ResultData();
        ModelAndView modelAndView = new ModelAndView();


        modelAndView.addObject("isInit", true);
        modelAndView.setViewName("/pages/homepage/home-page");
        modelAndView.addObject("resultData",resultData);
        return modelAndView;
    }
}
