package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.service.intf.TeacherService;
import com.lsjbc.vdtts.tools.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@RestController
@RequestMapping("/teacherController")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @RequestMapping(value = "/findTeacherList")
 /*
  *@Description:
  *@Author:刘海
  *@Param:[request, response]
  *@return:java.lang.String
  *@Date:2020/6/7 11:56
  **/
  
    
    public String findTeacherList(HttpServletRequest request, HttpServletResponse response){
        String page = request.getParameter("page");//接收前端界面的分页在第几页
        String limit = request.getParameter("limit");//接收前端界面查询数量
        String tSchoolId = request.getParameter("tShoolId");//接收前端保存的驾校id
        int pageSize = Integer.parseInt(limit);
        int start = (Integer.parseInt(page)-1)*pageSize;//计算从数据库第几条开始查
        int teachCount = teacherService.findTeacherCount(1);
        ArrayList<Teacher> teacherList = teacherService.findTeacherList(start,pageSize,1);
        LayuiData layuiData = new LayuiData();
        layuiData.setCode(0);
        layuiData.setMsg("查询成功");
        layuiData.setCount(teachCount);
        layuiData.setData(teacherList);
        return JSON.toJSONString(layuiData);//返回前端所需要的数据类型
    }


    /*
     *@Description:
     *@Author:刘海
     *@Param:
     *@return:
     *@Date:2020/6/7 14:50
     **/

    public String findAccount(){
        return  null;
    }
}
