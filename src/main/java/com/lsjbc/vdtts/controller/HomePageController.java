package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.entity.Link;
import com.lsjbc.vdtts.entity.Notice;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.LinkServive;
import com.lsjbc.vdtts.service.intf.NoticeSerivice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomePageController {
    @Autowired
    private LinkServive linkServive;
    @Autowired
    private NoticeSerivice noticeSerivice;
/*
 *@Description:
 *@Author:李浪_191019
 *@Param:
 *@return:modelAndView
 *@Date:2020/6/7 14:05
 **/
    @RequestMapping(value = "home")
    public ModelAndView InitHomePage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("isInit", true);
        modelAndView = linkServive.HomePageBlogroll(new Link(),modelAndView);
        modelAndView = noticeSerivice.HomePageNoticeOrLaw(new Notice(), modelAndView);
        modelAndView.setViewName("/pages/homepage/home-page");
        return modelAndView;
    }
}
