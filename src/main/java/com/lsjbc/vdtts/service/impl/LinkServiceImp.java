package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.LinkMapper;
import com.lsjbc.vdtts.entity.Link;
import com.lsjbc.vdtts.service.intf.LinkServive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 11:28
 */
@Service
public class LinkServiceImp implements LinkServive {
    @Autowired
    private LinkMapper linkMapper;
    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[link]
     *@return:java.util.List<com.lsjbc.vdtts.entity.Link>
     *@Date:2020/6/10 13:54
     **/
    public List<Link> drivingSchoolBlogroll(Link link){//驾校友情链接
        return linkMapper.getBlogroll(link,2,10);
    }
    @Override
    public ModelAndView HomePageBlogroll(Link link,ModelAndView modelAndView){
        //获取实名认证
        modelAndView.addObject("approve",linkMapper.getBlogroll(link,0,2));
        //获取友情链接
        modelAndView.addObject("blogroll",linkMapper.getBlogroll(link,2,10));
        return modelAndView;
    }
}
