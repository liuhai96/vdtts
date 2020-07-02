package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.impl.StudentServiceImpl;
import com.lsjbc.vdtts.utils.baidu.baiduTools.face.SearchFace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**人脸识别控制层
 * @author LiLang9725
 * @date 2020/6/21 15:38
 */
@Controller
@RequestMapping
public class HumanFaceController {
    @Autowired
    private StudentServiceImpl studentService;

    @RequestMapping("/addFace")
    /*
     *@Description:加人脸到第三方数据库
     *@Author:李浪_191019
     *@Param:[base64, sId]//传参 图片转base64,学生id
     *@return:java.lang.String
     *@Date:2020/6/22 20:57
     **/
    public String AddFace(String base64, int sId,HttpServletRequest request){
        request.getSession().setAttribute("xx", 1);
        try{
            ResultData resultData = studentService.AddFace(base64,sId);
            request.getSession().setAttribute("resultAddFace", resultData.getData().get("result"));
            request.getSession().setAttribute("xx", 0);
        } catch (Exception e){
            request.getSession().setAttribute("resultAddFace", -1);
        }
        return "/pages/student/add-student-face";
    }

    private boolean loginKey = true;
    @Autowired
    private SearchFace searchFace;
    /*
     *@Description://人脸识别登录
     *@Author:李浪_191019
     *@Param:[base64]
     *@return:java.lang.String
     *@Date:2020/6/22 21:57
     **/
    @RequestMapping(value = "/lookFace")
    public String lookAtTheFace(String base64, HttpServletRequest request){
        String nextJsp;
        if(loginKey){
            loginKey = false;
            request.getSession().setAttribute("ll", "1");
            try {
                request.getSession().setAttribute("result",studentService.FaceLogin(request,base64));
                if (request.getSession().getAttribute("account") != null){//人脸识别成功
                    nextJsp = "redirect:/student/main"; //redirect:重定向到index的后台
                    request.getSession().setAttribute("ll", 0);
                } else {
                    nextJsp = "/pages/index/student_login"; //redirect:重定向到学生登录的后台
                    request.getSession().setAttribute("ll", -1);
                }
            } catch (Exception e){
                request.getSession().setAttribute("ll", -1);
                nextJsp = "/pages/index/student_login";//redirect:重定向到学生登录的后台
            }
            loginKey = true;
        } else {
            try { Thread.sleep(1200); } catch (InterruptedException e) {}
            nextJsp = "/pages/student/human-face";
        }
        return nextJsp;
    }
}
