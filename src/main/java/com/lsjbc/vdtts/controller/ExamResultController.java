package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.service.intf.ExamResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/examResultController")
public class ExamResultController {
    @Autowired
    private ExamResultService examResultService;
    @RequestMapping(value = "/selectStudentExamList")
    /*
     *@Description:查询考试情况
     *@Author:刘海
     *@Param:[request, response]
     *@return:java.lang.Object
     *@Date:2020/6/10 23:59
     **/
    public Object selectStudentExamList(HttpServletRequest request, HttpServletResponse response){
        String page = request.getParameter("page");//接收前端界面的分页在第几页
        String limit = request.getParameter("limit");//接收前端界面查询数量
        int pageSize = Integer.parseInt(limit);
        int start = (Integer.parseInt(page)-1)*pageSize;//计算从数据库第几条开始查
        return JSON.toJSONString(examResultService.selectStudentExamList(start,pageSize,1));
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

    @RequestMapping(value = "/enterResults")
    /*
     *@Description:录入学员成绩
     *@Author:刘海
     *@Param:[erId, sId, examSujectId, erScore]
     *@return:java.lang.Object
     *@Date:2020/6/11 11:12
     **/
    public Object enterResults(String erId,String sId,String examSujectId,String erScore){
        return JSON.toJSONString(examResultService.enterResults(Integer.parseInt(erId),Integer.parseInt(sId),Integer.parseInt(examSujectId),Integer.parseInt(erScore)));
    }
}
