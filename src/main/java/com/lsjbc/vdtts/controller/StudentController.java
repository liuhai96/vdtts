package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.service.intf.StudentService;
import com.lsjbc.vdtts.tools.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/StudentController")
public class StudentController {
    @Autowired
    private StudentService studentService;
    private  Student student = new Student();


    @RequestMapping(value = "/selectstudentinfo")//初始化学员信息表
    public Object selectadmininfo(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam(value = "page") String page ,@RequestParam(value = "limit") String limit,
                                  Student student) {
        int page2 = (Integer.valueOf(page)-1)*Integer.valueOf(limit);
        System.out.println(" ---page2="+page2);
//            tbAdmin.setAdminName(adminname);
        List<Student> list= studentService.selectAllInfo(student,page2,Integer.valueOf(limit));
        int count =studentService.selectCount(student);
        System.out.println("初始化操作--- list="+list+" count ="+count);
        LayuiData layuiData = new LayuiData();
        layuiData.setCode(0);
        layuiData.setData(list);
        layuiData.setCount(count);
        return layuiData;
    }

    @RequestMapping(value = "/insertstudent")//添加学员
    public String insertadmin(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(value = "account") String account ,@RequestParam(value = "pwd") String pwd ,
                              @RequestParam(value = "sex") String sex ,@RequestParam(value = "role") String role) {
        System.out.println("添加操作--- account:"+account+" pwd:"+pwd+" sex:"+sex+" role:" +role);
        student.setsName(account);
        int i=studentService.insertstudent(student);
        String res = "";
        if(i>0){
            res="success";
            System.out.println("学员添加成功");
            return res;
        }else {
            res="failed";
            System.out.println("学员添加失败");
            return res;
        }
    }


    @RequestMapping(value = "/updatestudent")//修改学员
    public String updateadmin(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(value = "account") String account,@RequestParam(value = "pwd") String pwd ,
                              @RequestParam(value = "studentId") String studentId ) {

        System.out.println("修改操作--- account:"+account+" pwd:"+pwd+" studentId:"+studentId);
        student.setsAccountId(Integer.valueOf(account));
        student.setsId(Integer.valueOf(studentId));
        int i=studentService.updatestudent(student);
        String res = "";
        if(i>0){
            res="success";
            System.out.println("学员修改成功");
            return res;
        }else {
            res="failed";
            System.out.println("学员修改失败");
            return res;
        }
    }


    @RequestMapping(value = "/deletestudent")//删除学员
    public String deleteadmin(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(value = "studentId") String studentId ) {
        System.out.println(" studentId:"+studentId);
        student.setsId(Integer.valueOf(studentId));
        int i=studentService.deletestudent(student);
        String res = "";
        if(i>0){
            res="success";
            System.out.println("学员删除成功");
            return res;
        }else {
            res="failed";
            System.out.println("学员删除失败");
            return res;
        }
    }


}
