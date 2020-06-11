package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.NoticeMapper;
import com.lsjbc.vdtts.entity.Notice;
import com.lsjbc.vdtts.service.intf.NoticeSerivice;
import com.lsjbc.vdtts.utils.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author LiLang9725
 * @date 2020/6/10 20:51
 */
@Service
public class NoticeSeriviceImp implements NoticeSerivice {
    @Autowired
    private NoticeMapper noticeMapper;
    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[notice, modelAndView]
     *@return:org.springframework.web.servlet.ModelAndView
     *@Date:2020/6/10 21:07 首页提取公告个法律法律信息
     **/
    public ModelAndView HomePageNoticeOrLaw(Notice notice, ModelAndView modelAndView) {
        Tool tool = new Tool();

        notice.setNType("law");//法律
        modelAndView.addObject("law",noticeMapper.getNoticeOrLaw(notice,null));
        int month = Integer.parseInt(tool.getDate("MM"))-1;
        String n_time = "";
        /*只公告前一个月内的通知*/
        if (month == 0){ //当前时间1月份，取上一年12的通知
            month = 12;
            n_time = (Integer.parseInt(tool.getDate("yyyy"))-1)+"/"
                    +month+"/"+tool.getDate("dd HH:mm:ss");
        } else if (month < 10)//当前时间2~10月
            n_time = tool.getDate("yyyy")+"/0"+month+"/"+tool.getDate("dd HH:mm:ss");
        else n_time = tool.getDate("yyyy")+"/"+month+"/"+tool.getDate("dd HH:mm:ss");//当前时间11~12月
        notice.setNTime(n_time);
        notice.setNType("notice");//通知
        modelAndView.addObject("notice",noticeMapper.getNoticeOrLaw(notice,tool.getDate("yyyy/MM/dd HH:mm:ss")));

        return modelAndView;
    }
}
