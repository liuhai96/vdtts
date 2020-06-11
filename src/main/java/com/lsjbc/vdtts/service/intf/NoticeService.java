package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Notice;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 20:47
 */
public interface NoticeService {
    ModelAndView HomePageNoticeOrLaw(Notice notice, ModelAndView modelAndView);

    /**
     * 获取首页显示的通知公告
     *
     * @return 通知公告集合
     * @author JX181114 --- 郑建辉
     */
    List<Notice> getIndexPageNotice();

    /**
     * 获取首页显示的法律法规
     *
     * @return 法律法规集合
     * @author JX181114 --- 郑建辉
     */
    List<Notice> getIndexPageLaw();
}
