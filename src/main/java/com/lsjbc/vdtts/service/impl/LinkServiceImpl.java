package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.LinkDao;
import com.lsjbc.vdtts.dao.mapper.LinkMapper;
import com.lsjbc.vdtts.entity.Link;
import com.lsjbc.vdtts.service.intf.LinkServive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 11:28
 */
@Service(LinkServiceImpl.NAME)
public class LinkServiceImpl implements LinkServive {

    /**
     * Bean名
     */
    public static final String NAME = "LinkServive";


    @Resource
    private LinkMapper linkMapper;

    @Resource(name = LinkDao.NAME)
    private LinkDao linkDao;

    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[link]
     *@return:java.util.List<com.lsjbc.vdtts.entity.Link>
     *@Date:2020/6/10 13:54
     **/
    public List<Link> drivingSchoolBlogroll(Link link) {//驾校友情链接
        return linkMapper.getBlogroll(link, 2, 10);
    }

    @Override
    public ModelAndView HomePageBlogroll(Link link, ModelAndView modelAndView) {
        //获取实名认证
        modelAndView.addObject("approve", linkMapper.getBlogroll(link, 0, 2));
        //获取友情链接
        modelAndView.addObject("blogroll", linkMapper.getBlogroll(link, 2, 10));
        return modelAndView;
    }

    /**
     * 获取页面底部的友情链接
     *
     * @return 友情链接集合
     * @author JX181114 --- 郑建辉
     */
    @Override
    public List<Link> getFooterFriendLink() {
        return linkDao.getAll();
    }
}
