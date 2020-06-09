package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@RestController
@RequestMapping("/teacherController")
public class TeacherController {

 /*
  *@Description:
  *@Author:刘海
  *@Param:[request, response]
  *@return:java.lang.String
  *@Date:2020/6/7 11:56
  **/

    @Autowired
    private TeacherService teacherService;
    @RequestMapping(value = "/findTeacherList")
    public String findTeacherList(HttpServletRequest request, HttpServletResponse response){
        String page = request.getParameter("page");//接收前端界面的分页在第几页
        String limit = request.getParameter("limit");//接收前端界面查询数量
        String tSchoolId = request.getParameter("tShoolId");//接收前端保存的驾校id
        int pageSize = Integer.parseInt(limit);
        int start = (Integer.parseInt(page)-1)*pageSize;//计算从数据库第几条开始查
        int teachCount = teacherService.findTeacherCount(1);
        ArrayList<Teacher> teacherList = teacherService.findTeacherList(start,pageSize,1);
        LayuiTableData layuiData = new LayuiTableData();
        layuiData.setCode(0);
        layuiData.setMsg("查询成功");
        layuiData.setCount(teachCount);
        layuiData.setData(teacherList);
        return JSON.toJSONString(layuiData);//返回前端所需要的数据类型
    }


 /*
  *@Description:添加教练
  *@Author:刘海
  *@Param:Teacher teacher  Account teacherAccount
  *@return:
  *@Date:2020/6/7 23:09
  **/

   @RequestMapping(value = "/addTeacher")
    public String addTeacher(Teacher teacher,Account teacherAccount){
        LayuiTableData layuiData = teacherService.addTeacher(teacher,teacherAccount);
        return JSON.toJSONString(layuiData);
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
    public String teacherList(HttpServletRequest request, HttpServletResponse response) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数
        //查名字
        String tName = request.getParameter("tName");
//        //查驾照时间
//        String sLicenseTime=request.getParameter("sLicenseTime");
        String draw = request.getParameter("draw");//重绘次数 和前台对应

        Teacher teacher = new Teacher();
        teacher.setTName(tName);
//        student.setSLicenseTime(sLicenseTime);
        LayuiTableData layuiTableData = teacherService.teacherList(teacher, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiTableData);
    }

}
