package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.service.intf.ExamResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/examResultController")
public class ExamResultController {
    @Autowired
    private ExamResultService examResultService;
    /*
     *@Description:查询考试情况
     *@Author:刘海
     *@Param:[request, response]
     *@return:java.lang.Object
     *@Date:2020/6/10 23:59
     **/
    @RequestMapping(value = "/selectStudentExamList")
    public Object selectStudentExamList(String page, String limit, String sName, String studentName, HttpServletRequest request){
        System.out.println("sName>>>>>"+sName);
        System.out.println("sName>>>>>"+studentName);
        return JSON.toJSONString(examResultService.selectStudentExamList(page,limit,sName,request));
    }

    @RequestMapping(value = "/arringeExam")
    /*
     *@Description:安排学员考试
     *@Author:刘海
     *@Param:[erId, sId, examSujectId, teacherId]
     *@return:java.lang.Object
     *@Date:2020/6/10 23:59
     **/
    public Object arringeExam(String erId,String sId,String examSujectId,String teacherId){

        return JSON.toJSONString(examResultService.arringeExam(Integer.parseInt(erId),Integer.parseInt(sId),Integer.parseInt(examSujectId),Integer.parseInt(teacherId)));
    }


    /*
     *@Description:录入学员成绩
     *@Author:刘海
     *@Param:[erId, sId, examSujectId, erScore]
     *@return:java.lang.Object
     *@Date:2020/6/11 11:12
     **/
    @RequestMapping(value = "/enterResults")
    public Object enterResults(String erId,String sId,String examSujectId,String erScore){
        return JSON.toJSONString(examResultService.enterResults(Integer.parseInt(erId),Integer.parseInt(sId),Integer.parseInt(examSujectId),Integer.parseInt(erScore)));
    }
}
