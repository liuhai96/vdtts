package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.impl.StudentServiceImpl;
import com.lsjbc.vdtts.utils.FileTools;
import com.lsjbc.vdtts.utils.Tool;
import com.lsjbc.vdtts.utils.baidu.baiduTools.face.ManageFace;
import com.lsjbc.vdtts.utils.baidu.baiduTools.face.SearchFace;
import com.lsjbc.vdtts.utils.baidu.baiduTools.face.TFaceMethod;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

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
    public ModelAndView AddFace(String base64, int sId){
        ModelAndView modelAndView = new ModelAndView();
        ResultData resultData = studentService.AddFace(base64,sId);
        modelAndView.addObject("result", resultData);
        modelAndView.setViewName("/");
        return modelAndView;
    }


    @Autowired
    private SearchFace searchFace;
    @RequestMapping(value = "/lookFace")
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[base64]
     *@return:java.lang.String
     *@Date:2020/6/22 21:57
     **/
    public ModelAndView lookAtTheFace(String base64, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("result",studentService.FaceLogin(request,base64));
        try {
            if (request.getSession().getAttribute("aId").toString().equals("0")){
                modelAndView.setViewName("/pages/index/index");
            } else {
                modelAndView.setViewName("/pages/index/student");
            }
        } catch (Exception e){
            modelAndView.setViewName("/pages/index/student");
        }
        return modelAndView;
    }

}
