package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.entity.Link;
import com.lsjbc.vdtts.entity.Notice;
import com.lsjbc.vdtts.service.intf.LinkService;
import com.lsjbc.vdtts.service.intf.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomePageController {
    @Autowired
    private LinkService linkServive;
    @Autowired
    private NoticeService noticeSerivice;
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
