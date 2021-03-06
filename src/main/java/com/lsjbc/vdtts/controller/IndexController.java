package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.constant.EvaluateType;
import com.lsjbc.vdtts.dao.ExamResultDao;
import com.lsjbc.vdtts.dao.StudentDao;
import com.lsjbc.vdtts.dao.SchoolDao;
import com.lsjbc.vdtts.dao.TeacherDao;
import com.lsjbc.vdtts.entity.*;
import com.lsjbc.vdtts.pojo.dto.QuestionBank;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.pojo.vo.StudentRegister;
import com.lsjbc.vdtts.service.impl.*;
import com.lsjbc.vdtts.service.intf.*;
import com.lsjbc.vdtts.utils.CustomStringUtils;
import com.lsjbc.vdtts.utils.CustomTimeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: IndexController
 * @Description: 首页的界面控制类
 * @Datetime: 2020/6/15   11:09
 * @Author: JX181114 - 郑建辉
 */
@Controller
public class IndexController {

    @Resource(name = NoticeServiceImpl.NAME)
    private NoticeService noticeService;

    @Resource(name = LinkServiceImpl.NAME)
    private LinkService linkServive;

    @Resource(name = VideoServiceImpl.NAME)
    private VideoService videoService;

    @Resource(name = ExamResultDao.NAME)
    private ExamResultDao examResultDao;

    @Resource(name = TeacherServiceImpl.NAME)
    private TeacherService teacherService;

    @Resource(name = QuestionBank.NAME)
    private QuestionBank questionBank;

    @Resource(name = ExamErrorServiceImpl.NAME)
    private ExamErrorService examErrorService;

    @Resource(name = StudentServiceImpl.NAME)
    private StudentService studentService;

    @Resource(name = StudentDao.NAME)
    private StudentDao studentDao;

    @Resource(name = SchoolDao.NAME)
    private SchoolDao schoolDao;

    @Resource(name = TeacherDao.NAME)
    private TeacherDao teacherDao;

    //陈竑霖
    @Resource(name = SchoolServiceImpl.NAME)
    private SchoolService schoolService;

    /**
     * 访问主页
     *
     * @return 页面
     */
    @GetMapping("/")
    public String index() {
        return "redirect:/index";
    }

    /**
     * 访问主页
     *
     * @param map ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("index")
    public String index2(Map<String, Object> map,HttpServletRequest request) {

//        request.getSession().setAttribute("student", Student.builder().sId(19).build());
        map.put("schoolList", schoolService.getFiveMostPowerfulSchool());
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
    @GetMapping("publicity/{type}/{page}/{noticeId}")
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
     * 访问学教专区的页面
     *
     * @param map     ModelAndView中的属性键值对
     * @param request HttpServletRequest
     * @return 页面
     */
    @GetMapping("student")
    public String student(Map<String, Object> map, HttpServletRequest request, @ModelAttribute("zjh_msg")String msg) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果用户未登录，直接访问登录页面
            map.put("iframeUrl", "/student/login");
        } else {
            //如果用户已经登录，直接访问学员主页
            map.put("iframeUrl", "/student/main");
        }

        map.put("linkList", linkServive.getFooterFriendLink());


        if(null!=msg){
            map.put("zjh_msg",msg);
        }
        return "/pages/index/student";
    }

    /**
     * 访问学员登录界面
     *
     * @return 页面
     */
    @GetMapping("student/login")
    public String studentLogin() {
        return "/pages/index/student_login";
    }

    /**
     * 学员注销
     *
     * @param request HttpServletRequest
     * @return 页面
     */
    @GetMapping("logout/student")
    public String studentLogout(HttpServletRequest request) {
        request.getSession().removeAttribute("student");
        request.getSession().invalidate();
        return "redirect:/index";
    }

    /**
     * 学员访问学员主页
     *
     * @param map     ModelAndView中的属性键值对
     * @param request HttpServletRequest
     * @return
     */
    @GetMapping("student/main")
    public String studentMain(Map<String, Object> map, HttpServletRequest request) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果用户未登录，直接访问登录页面
            map.put("zjh_msg", "如需访问主页，请先登录");
            return "/pages/index/student_login";
        }

        map.put("studentId", student.getSId());
        map.put("faceIn", "false");

        return "/pages/student/home";
    }

    /**
     * 跳转至模拟考试页面
     *
     * @param level 模拟考试等级
     * @param map   ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("test/{level}")
    public String test(@PathVariable("level") Integer level, HttpServletRequest request, Map<String, Object> map) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果获取不到，就返回到登录页面，提示登录
            map.put("zjh_msg", "如需参加模拟考试，请先登录");
            return "/pages/index/student_login";
        }

        ExamResult result = examResultDao.getByStudentId(student.getSId());

        switch (level) {
            case 1:
                if (result.getErState1() == 1) {
                    map.put("zjh_msg", "你已经通过考试，不可进入模拟考试");
                    return "/pages/student/home";
                }
                break;
            case 4:
                if (result.getErState3() != 1) {
                    map.put("zjh_msg", "通过科目三考试才可以进入");
                    return "/pages/student/home";
                }
                if (result.getErState4() == 1) {
                    map.put("zjh_msg", "你已经通过考试，不可进入模拟考试");
                    return "/pages/student/home";
                }
                break;
            default:
        }

        if (!questionBank.hasQuestion(level)) {
            map.put("zjh_msg", "暂无试题");
            return "/pages/student/home";
        }

        map.put("studentId", student.getSId());
        map.put("studentName", student.getSName());
        map.put("sex", student.getSSex());
        map.put("level", level);
        map.put("levelName", level == 1 ? "科目一" : "科目四");
        return "/pages/student/test";
    }

    /**
     * 跳转至错题重做页面
     *
     * @param level 模拟考试等级
     * @param map   ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("retest/{level}")
    public String retest(@PathVariable("level") Integer level, HttpServletRequest request, Map<String, Object> map) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果获取不到，就返回到登录页面，提示登录
            map.put("zjh_msg", "如需进行错题重做，请先登录");
            return "/pages/index/student_login";
        }

        if (examErrorService.getErrorQuestionByStudentId(level, student.getSId()).size() == 0) {
            map.put("zjh_msg", "你在当前科目没有错题，你真是胖胖呢");
            return "/pages/student/home";
        }

        map.put("studentId", student.getSId());
        map.put("studentName", student.getSName());
        map.put("sex", student.getSSex());
        map.put("level", level);
        map.put("levelName", level == 1 ? "科目一" : "科目四");
        return "/pages/student/retest";
    }


    /**
     * 跳转到指定视频的播放页
     *
     * @param level   指定科目
     * @param videoId 指定时评ID
     * @param map     ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("video/{level}/{videoId}")
    public String video(@PathVariable("level") Integer level, @PathVariable("videoId") Integer videoId, HttpServletRequest request, Map<String, Object> map) {

        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            //如果获取不到，就返回到登录页面，提示登录
            map.put("zjh_msg", "如需进观看教学视频，请先登录");
            return "/pages/index/student_login";
        }

        ExamResult result = examResultDao.getByStudentId(student.getSId());

        switch (level) {
            case 2:
                if (result.getErState1() != 1) {
                    map.put("zjh_msg", "通过科目一考试才可以进入");
                    return "/pages/student/home";
                }
                break;
            case 3:
                if (result.getErState2() != 1) {
                    map.put("zjh_msg", "通过科目二考试才可以进入");
                    return "/pages/student/home";
                }
                break;
            default:
        }


        Video video = videoService.getVideoById(videoId);
        List<Video> videoList = videoService.getVideoByLevel(level);

        map.put("studentId", student.getSId());
        map.put("level", level);
        map.put("levelName", level == 2 ? "科目二" : "科目三");
        map.put("video", video);
        map.put("videoList", videoList);
        map.put("record", "true");


        if((level==2&&result.getErState2() == 1)||(level==3&&result.getErState3() == 1)){
            map.put("zjh_msg", "你已经通过考试，观看视频将不会获取学时");
            map.put("record", "false");
            return "/pages/student/video_look";
        }

        return "/pages/student/video_look";
    }

    /**
     * 访问信息中心
     *
     * @param map  ModelAndView中的属性键值对
     * @param type 要访问的是教练还是驾校
     * @param name 访问的名字
     * @return 页面
     */
    @PostMapping("inquire")
    public String inquire(Map<String, Object> map, String type, String name) {
        if (type != null) {
            map.put("type", type);
            map.put(type.equalsIgnoreCase(EvaluateType.TYPE_SCHOOL) ? "schoolName" : "teacherName", name);
        }
        map.put("linkList", linkServive.getFooterFriendLink());
        return "/pages/index/inquire";
    }

    /**
     * 跳转到教练的详细信息界面
     *
     * @param map          ModelAndView中的属性键值对
     * @param teacherId    教练ID
     * @param score        评分
     * @param studentCount 学员人数
     * @param school       驾校名称
     * @return 页面
     */
    @PostMapping("teacher")
    public String inquireTeacher(Map<String, Object> map, Integer teacherId, Double score, Integer studentCount, String school) {
        Teacher teacher = teacherService.zjhGetObjectByTeacherId(teacherId);

        map.put("tid", teacher.getTId());
        map.put("name", teacher.getTName());
        map.put("id", CustomStringUtils.encryptionIdCardNumber(teacher.getTSfz()));
        map.put("sex", teacher.getTSex());
        map.put("age", CustomTimeUtils.getTimeSubTime(teacher.getTBirthday()));
        map.put("count", studentCount);
        map.put("school", school);
        map.put("score", score);
        School schoolEntity = schoolService.getSchoolBySchoolId(teacher.getTSchoolId());
        map.put("sid",schoolEntity.getSId());
        map.put("payfee",schoolEntity.getSRegisteryFee());
        map.put("linkList", linkServive.getFooterFriendLink());
        map.put("pic",teacher.getTPic());
        return "/pages/index/inquire_teacher";
    }

    /**
     * 跳转到驾校的详细信息界面
     *
     * @param map          ModelAndView中的属性键值对
     * @param schoolid     教练ID
     * @param score        评分
     * @param studentCount 学员人数
     * @param teachercount 教练人数
     * @param carcount     车数
     * @return 页面
     */
    @PostMapping("school")
    public String inquireSchool(Map<String, Object> map, Integer schoolid, Double score, Integer studentCount, String teachercount, String carcount) {
        School school = schoolService.getSchoolBySchoolId(schoolid);

        map.put("sid", school.getSId());
        map.put("sRegisteryFee", school.getSRegisteryFee());
        map.put("sbusinessId", school.getSBusinessId());
        map.put("time", school.getSRegTime());
        map.put("teachercount", teachercount);
        map.put("carcount", carcount);
        map.put("address", school.getSAddress());
        map.put("studencount", studentCount);
        map.put("score", score);
        map.put("name", school.getSName());
        map.put("pic",school.getSImageUrl());

        map.put("linkList", linkServive.getFooterFriendLink());

        return "/pages/index/inquire_school";
    }

    /**
     * 跳转到注册页
     *
     * @return
     */
    @GetMapping("/student/register")
    public String studentRegister() {
        return "/pages/index/register";
    }

    /**
     * 跳转到智能客服页
     *
     * @return
     */
    @GetMapping("/robot")
    public String robot() {
        return "/robot/robot";
    }

    /**
     * 用户进行注册操作
     *
     * @param register 注册信息
     * @param map      ModelAndView中的属性键值对
     * @param request  Request域
     * @return 页面
     */
    @PostMapping("/student/register")
    public String StudentRegister(StudentRegister register, Map<String, Object> map, HttpServletRequest request) {
        return studentService.studentRegister(register, map, request);
    }

    /**
     * 跳转到评价界面
     * @param request request域
     * @param map ModelAndView属性集合
     * @param attr 重定向属性集合
     * @param toId 评价对象ID
     * @param toType 评价对象类型
     * @return
     */
    @GetMapping("evaluate")
    public String evaluate(HttpServletRequest request, Map<String,Object> map, RedirectAttributes attr, Integer toId, String toType){
        Student student = (Student) request.getSession().getAttribute("student");

        if(student==null){
            attr.addFlashAttribute("zjh_msg","请先登录");
            return "redirect:/student";
        }

        //获取最新的学员信息
        student = studentDao.getById(student.getSId());
        request.getSession().setAttribute("student",student);

        if(toType.equals(EvaluateType.TYPE_SCHOOL)){
            if(toId.equals(student.getSSchoolId())){
                map.put("sid",toId);
                return "/back/schoolevaluate";
            }
            map.put("zjh_msg","未报名该驾校，无法评价");
            map.put("linkList", linkServive.getFooterFriendLink());
            map.put("schoolName","");
            return "/pages/index/inquire";
        }else if(toType.equals(EvaluateType.TYPE_TEACHER)){
            if(toId.equals(student.getSTeacherId())){
                map.put("tid",toId);
                return "/back/teacherevaluate";
            }
            map.put("zjh_msg","不是该教练的学员，无法评价");
            map.put("teacherName","");
            map.put("linkList", linkServive.getFooterFriendLink());
            return "/pages/index/inquire";
        }

        return "redirect:/index";
    }

    @GetMapping("pay/{sid}")
    public String pay(HttpServletRequest request,Map<String,Object> map,@PathVariable("sid") Integer sid){
        School school = schoolDao.getById(sid);
        map.put("sid",sid);
        map.put("name",school.getSName());
        map.put("sRegisteryFee",school.getSRegisteryFee());
        return "/pages/index/paypage";
    }


    @GetMapping("tpay/{teacherId}")
    public  String tpay(HttpServletRequest request,Map<String,Object> map,@PathVariable("teacherId") Integer teacherid){
        Teacher teacher = teacherDao.getById(teacherid);
        Integer sid = teacher.getTSchoolId();
        School school = schoolDao.getById(sid);
        map.put("sid",sid);
        map.put("name",school.getSName());
        map.put("sRegisteryFee",school.getSRegisteryFee());
        map.put("teacherId",teacherid);
        map.put("teacherName",teacher.getTName());
        return "/pages/index/paypage";
    }

    /**
     * 人脸识别登录
     * @param base64 图片
     * @param request
     * @param map
     * @return
     */
    @PostMapping("login/student/face")
    public String faceLoginStudent(String base64, HttpServletRequest request,Map<String,Object> map){
        ResultData resultData = studentService.FaceLogin(request, base64);

        map.put("zjh_msg",resultData.getMsg());

        if(resultData.getCode()==0) {
            map.put("studentId", ((Student)request.getSession().getAttribute("student")).getSId());
            map.put("faceIn", "true");

            return "/pages/student/home";
        }

        return "/pages/index/student_login";

    }
}
