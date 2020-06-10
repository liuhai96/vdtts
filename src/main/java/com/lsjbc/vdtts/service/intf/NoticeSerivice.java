package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Notice;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author LiLang9725
 * @date 2020/6/10 20:47
 */
public interface NoticeSerivice {
    public ModelAndView HomePageNoticeOrLaw(Notice notice,ModelAndView modelAndView);
}
