package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Link;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 11:27
 */
public interface LinkServive {
    List<Link> drivingSchoolBlogroll(Link link);
    ModelAndView HomePageBlogroll(Link link,ModelAndView modelAndView);

    /**
     * 获取页面底部的友情链接
     *
     * @return 友情链接集合
     * @author JX181114 --- 郑建辉
     */
    List<Link> getFooterFriendLink();
}
