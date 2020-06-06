package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.pojo.vo.ResultData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomePageController {

    @RequestMapping(value = "home")
    public ModelAndView InitHomePage(){
        ResultData resultData = new ResultData();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/home-page/home-page");
        modelAndView.addObject("resultData",resultData);
        return modelAndView;
    }
}
