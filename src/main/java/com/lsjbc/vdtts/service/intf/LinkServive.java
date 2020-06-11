package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Link;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 11:27
 */
public interface LinkServive {
    public List<Link> drivingSchoolBlogroll(Link link);
    public ModelAndView HomePageBlogroll(Link link,ModelAndView modelAndView);
}
