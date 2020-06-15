package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.dao.ExamResultDao;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.entity.Video;
import com.lsjbc.vdtts.service.impl.LinkServiceImpl;
import com.lsjbc.vdtts.service.impl.NoticeServiceImpl;
import com.lsjbc.vdtts.service.impl.VideoServiceImpl;
import com.lsjbc.vdtts.service.intf.LinkServive;
import com.lsjbc.vdtts.service.intf.NoticeService;
import com.lsjbc.vdtts.service.intf.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: ZjhTestController
 * @Description:
 * @Datetime: 2020/6/11   11:16
 * @Author: JX181114 - 郑建辉
 */
@Controller
public class ZjhTestController {

    @Resource(name = NoticeServiceImpl.NAME)
    private NoticeService noticeService;

    @Resource(name = LinkServiceImpl.NAME)
    private LinkServive linkServive;

    @Resource(name = VideoServiceImpl.NAME)
    private VideoService videoService;

    @Resource(name = ExamResultDao.NAME)
    private ExamResultDao examResultDao;

    /**
     * 访问主页
     *
     * @param map ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/index")
    public String index(Map<String, Object> map) {

        map.put("noticeList", noticeService.getIndexPageNotice());
        map.put("lawList", noticeService.getIndexPageLaw());
        map.put("linkList", linkServive.getFooterFriendLink());

        return "/pages/index/index";
    }

    /**
     * 访问公开公示
     *
     * @param type     通知公告:notice   法律法规：law
     * @param page     要获取的特定页的数据
     * @param noticeId 要访问的通知ID
     * @param map      ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/publicity/{type}/{page}/{noticeId}")
    public String publicity(@PathVariable(value = "type") String type, @PathVariable(value = "page") Integer page
            , @PathVariable(value = "noticeId") Integer noticeId, Map<String, Object> map) {

        map.put("linkList", linkServive.getFooterFriendLink());
        map.put("type", type);
        map.put("page", page);
        map.put("noticeId", noticeId);

        if (noticeId > 0) {
            map.put("notice", noticeService.getById(noticeId));
        }

        return "/pages/index/publicity";
    }

    /**
     * 访问信息中心
     *
     * @param map ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/inquire")
    public String inquire(Map<String, Object> map) {

        map.put("linkList", linkServive.getFooterFriendLink());
        return "/pages/index/inquire";
    }

    /**
     * 跳转至模拟考试页面
     *
     * @param level 模拟考试等级
     * @param map   ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/test/{level}")
    public String test(@PathVariable("level") Integer level, HttpServletRequest request, Map<String, Object> map) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果获取不到，就返回到登录页面，提示登录
            map.put("zjh_msg", "请先登录");
//            return "";
        }

        if (!examResultDao.allowLearn(student.getSId(), level)) {
            //判断当前用户科目一/科目四的考试是否通过，如果通过了，就返回到主页，提示已通过不需要进行模拟考试
            map.put("zjh_msg", "你已经通过考试，不可以进入模拟考试");
//            return "";
        }

        map.put("studentId", student.getSId());
        map.put("studentName", student.getSName());
        map.put("level", level);
        map.put("levelName", level == 1 ? "科目一" : "科目四");
        return "/pages/index/test";
    }

    /**
     * 跳转到指定科目的视频首页
     *
     * @param level 指定科目
     * @param map   ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/video/{level}")
    public String video(@PathVariable("level") Integer level, HttpServletRequest request, Map<String, Object> map) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果获取不到，就返回到登录页面，提示登录
            map.put("zjh_msg", "请先登录");
//            return "";
        }

        if (!examResultDao.allowLearn(student.getSId(), level)) {
            //判断当前用户科目二/科目三的考试是否通过，如果通过了，就提示不会获得学时
            map.put("zjh_msg", "您已通过考试，观看视频将不会获得学时");
        }

        map.put("level", level);
        return "/pages/index/video";
    }


    /**
     * 跳转到指定视频的播放页
     *
     * @param level   指定科目
     * @param videoId 指定时评ID
     * @param map     ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/video/{level}/{videoId}")
    public String video(@PathVariable("level") Integer level, @PathVariable("videoId") Integer videoId, HttpServletRequest request, Map<String, Object> map) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果获取不到，就返回到登录页面，提示登录
            map.put("zjh_msg", "请先登录");
//            return "";
        }

        if (!examResultDao.allowLearn(student.getSId(), level)) {
            //判断当前用户科目二/科目三的考试是否通过，如果通过了，就提示不会获得学时
            map.put("zjh_msg", "您已通过考试，观看视频将不会获得学时");
        }


        Video video = videoService.getVideoById(videoId);
        List<Video> videoList = videoService.getVideoByLevel(level);

        map.put("studentId", student.getSId());
        map.put("level", level);
        map.put("levelName", level == 2 ? "科目二" : "科目三");
        map.put("video", video);
        map.put("videoList", videoList);

        return "/pages/index/video_look";
    }
}
