package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.service.intf.AccountService;
import com.lsjbc.vdtts.service.intf.StudentService;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.utils.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

import static java.lang.Integer.*;

@RestController
@RequestMapping("/StudentController")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private AccountService accountService;
    private  Student student = new Student();


    @RequestMapping(value = "/selectstudentinfo")//初始化学员信息表
    public Object selectadmininfo(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam(value = "page") String page ,@RequestParam(value = "limit") String limit,
                                  Student student) {
        int page2 = (valueOf(page)-1)* valueOf(limit);
        System.out.println(" ---page2="+page2);
//            tbAdmin.setAdminName(adminname);
        List<Student> list= studentService.selectAllInfo(student,page2, valueOf(limit));
        int count =studentService.selectCount(student);
        System.out.println("初始化操作--- list="+list+" count ="+count);
        LayuiTableData layuiData = new LayuiTableData();
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
        student.setSName(account);
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
        student.setSAccountId(valueOf(account));
        student.setSId(valueOf(studentId));
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
        student.setSId(valueOf(studentId));
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

    @RequestMapping(value = "/studentRegister")
    @ResponseBody
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[request, response, student, account] 学员首页注册
     *@return:java.lang.String
     *@Date:2020/6/8 22:19
     **/
    public String StudentRegister(HttpServletRequest request, HttpServletResponse response
            , Student student, Account account) {
        Tool tool = new Tool();
        LayuiTableData layuiData = new LayuiTableData();
        student.setSRegTime(tool.getDate("yyyy/MM/dd HH:mm:ss"));
        String sBirthday = student.getSSfz();
        if(sBirthday.length() == 15){
            if(Integer.valueOf(sBirthday.charAt(14)+"")%2 == 0){
                if(student.getSSex().equals("女"));
                else { layuiData.setMsg("非法证件!性别非法");return JSON.toJSONString(layuiData); }
            }
        } else if(sBirthday.length() == 18){
            if(Integer.valueOf(sBirthday.charAt(17)+"")%2 == 0){
                if(student.getSSex().equals("男"));
                else { layuiData.setMsg("非法证件!性别非法");return JSON.toJSONString(layuiData); }
            }
        }
        int yob = Integer.valueOf(sBirthday.substring(6, 10));//出生年
        int thisYear = Integer.valueOf(tool.getDate("yyyy"));//今年
        yob = thisYear-yob;
        if(yob < 0 || yob > 110){ layuiData.setMsg("非法证件!出生日期");return JSON.toJSONString(layuiData); }//证件无效
        else if(yob < 18 || yob > 70){ layuiData.setMsg("证件未在法律年内!!");return JSON.toJSONString(layuiData); }//证件满足要求
        student.setSBirthday(yob+"/"+sBirthday.substring(10, 12)+"/"+sBirthday.substring(12, 14));
        for(int i = 0;i < 3;i++){
            String aAccount = tool.getRandCode(tool.getRandom(6,11),"1234667890");
            if(studentService.registerSelect(aAccount) == null){
                student.setSAccountId(Integer.valueOf(aAccount));
                account.setAAccount(aAccount);
                account.setAType("student");
                if(studentService.registerStudent(student) > 0){
                    if(accountService.addStudentAccount(account) > 0)layuiData.setMsg("提交成功!");
                    else layuiData.setMsg("未知原因错误！!");
                }
            }
        }
        System.out.println(JSON.toJSONString(student));
        return JSON.toJSONString(layuiData);
    }

}
