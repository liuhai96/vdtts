package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.StudentService;
import com.lsjbc.vdtts.service.intf.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/teacherController")
public class TeacherController {

 /*
  *@Description：将查询的数据返回前端界面展示
  *@Author:刘海
  *@Param:[request, response]
  *@return:java.lang.String
  *@Date:2020/6/7 11:56
  **/

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/findTeacherList")
    public String findTeacherList(HttpServletRequest request, HttpServletResponse response){
        String page = request.getParameter("page");//接收前端界面的分页在第几页
        String limit = request.getParameter("limit");//接收前端界面查询数量
        String tSchoolId = request.getParameter("tShoolId");//接收前端保存的驾校id
        int pageSize = Integer.parseInt(limit);
        int start = (Integer.parseInt(page)-1)*pageSize;//计算从数据库第几条开始查
       LayuiTableData layuiTableData = teacherService.findTeacherList(start,pageSize,1);
       return JSON.toJSONString(layuiTableData, SerializerFeature.DisableCircularReferenceDetect);
    }


 /*
  *@Description:添加教练基本信息
  *@Author:刘海
  *@Param:Teacher teacher  Account teacherAccount
  *@return:
  *@Date:2020/6/7 23:09
  **/
   @RequestMapping(value = "/addTeacher")
    public String addTeacher(Teacher teacher,Account teacherAccount){
        LayuiTableData LayuiTableData = teacherService.addTeacher(teacher,teacherAccount);
        return JSON.toJSONString(LayuiTableData);
    }


    /*
     *@Description:删除教练信息
     *@Author:刘海
     *@Param:[teacher]
     *@return:java.lang.String
     *@Date:2020/6/8 16:21
     **/
    @RequestMapping(value = "/deleteTeacher")
    public String deleteTeacher(String tId){
        System.out.println("tId"+tId);
        LayuiTableData layuiTableData = teacherService.deleteTeacher(Integer.parseInt(tId));
       return JSON.toJSONString(layuiTableData);
    }



     @RequestMapping(value = "/updateTeacherInfo")
     /*
      *@Description:修改教练的基本信息
      *@Author:刘海
      *@Param:[teacher]
      *@return:java.lang.String
      *@Date:2020/6/8 21:49
      **/
    public String updateTeacherInfo(Teacher teacher){
        LayuiTableData layuiTableData = teacherService.updateTeacherInfo(teacher);
        return JSON.toJSONString(layuiTableData);
    }
    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607352442
     **/
    //教练表查看
    @RequestMapping(value = "/teacherList",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String teacherList(HttpServletRequest request, HttpServletResponse response,Teacher teacher) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数
        String draw = request.getParameter("draw");//重绘次数 和前台对应

        LayuiTableData layuiTableData = teacherService.teacherList(teacher, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiTableData);
    }



   @RequestMapping(value = "/findTeacher")
    public String findTeacher(){
        return JSON.toJSONString(teacherService.findTeacher(1));
    }

    @RequestMapping(value = "/updateTeacherApplyState")
    public Object updateTeacherApplyState(String tId){
        return  JSON.toJSONString(teacherService.updateTeacherApplyState(Integer.parseInt(tId)));
    }

    @RequestMapping(value = "/updateTeacherAccountLockState")
   public Object updateTeacherAccountLockState(String tId){
        return  JSON.toJSONString(teacherService.updateTeacherAccountLockState(Integer.parseInt(tId)));
    }
    @RequestMapping(value = "/teacherInit")
    public ModelAndView TeacherInit(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/pages/teacher/teacher");
        return modelAndView;
    }
    @RequestMapping(value = "/stuTableData")//教练查找学生信息
    public String StuTabelData(int page,int limit,Student student,HttpServletRequest request){
        LayuiTableData layuiTableData = studentService.selectList(student,page,limit);
        if(student.getSName() == null ||student.getSName().equals(""))
            request.getSession().setAttribute("studentCount", layuiTableData.getCount());
        return JSON.toJSONString(layuiTableData);
    }
}
