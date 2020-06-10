package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.service.intf.StudentService;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/studentController")
public class StudentController {
    @Autowired
    private StudentService studentService;
    private  Student student = new Student();

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/8 15860799877
     **/
    @RequestMapping(value = "/selectStudentInfo")//初始化学员信息表
    public Object selectadmininfo(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam(value = "page") String page ,@RequestParam(value = "limit") String limit,
                                  Student student) {
        int page2 = (Integer.valueOf(page)-1)*Integer.valueOf(limit);
        System.out.println(" ---page2="+page2);
        List<Student> list= studentService.selectAllInfo(student,page2,Integer.valueOf(limit));
        int count =studentService.selectCount(student);
        System.out.println("学员信息初始化操作--- list="+list+" count ="+count);
        LayuiTableData layuiData = new LayuiTableData();
        layuiData.setCode(0);
        layuiData.setData(list);
        layuiData.setCount(count);
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/resetPwd")//重置密码
    public String resetPwd(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(value = "accountId") String accountId ) {
        System.out.println(" accountId:"+accountId);
        int i=studentService.resetPwd(accountId);
        String res = "";
        if(i>0){
            res="success";
            System.out.println("学员重置密码成功");
            return res;
        }else {
            res="failed";
            System.out.println("学员重置密码失败");
            return res;
        }
    }

    @RequestMapping(value = "/insertstudent")//添加学员
    public String insertadmin(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(value = "account") String account ,@RequestParam(value = "pwd") String pwd ,
                              @RequestParam(value = "sex") String sex ,@RequestParam(value = "role") String role) {
        System.out.println("添加操作--- account:"+account+" pwd:"+pwd+" sex:"+sex+" role:" +role);
        student.setSchoolName(account);
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
        student.setSAccountId(Integer.valueOf(account));
        student.setSId(Integer.valueOf(studentId));
//        student.set
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
        student.setSId(Integer.valueOf(studentId));
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
