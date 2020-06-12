package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.UserLoginService;
import com.lsjbc.vdtts.utils.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *@Description:
 *@Author:李浪_191019
 *@Param:account 含有登录账号密码的登录实例类
 *@return:aType表明，aId登录成功后的登录者Id,
 *@Date:2020/6/8 1:30
 **/
@RestController
public class UserLoginController {
    @Autowired
    private UserLoginService userLoginService;

    @RequestMapping(value = "/userLogin")
    @ResponseBody
    public ResultData UserLogin(HttpServletRequest request, HttpServletResponse response, Account account){
        String nextJsp = null;//下一个界面的路径
        String notify = "";//弹窗通知信息
        Tool tool = new Tool();
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html;charset=utf-8");
        account.setAPassword(tool.createMd5(account.getAPassword()));//转MD5码
        account = userLoginService.UserLogin(account);//
        if(account != null){ //登录成功时
            switch (account.getAType()) {
                case "school": //驾校登录界面地址
                    nextJsp = "pages/staff/schoolmenu.jsp";
                    break;
                case "student":nextJsp = "pages/s";break;//学员登录界面地址
                case "teacher"://教练登录界面地址
                    nextJsp = "teacherController/teacherInit";
//                    request.getSession().setAttribute("", account.getAId());
                break;
            }
            request.getSession().setAttribute("aId", account.getAId());
            request.getSession().setAttribute("aType", account.getAType());
            notify = "恭喜你，登录成功！";
        } else {//登录失败
            nextJsp = "pages/homepage/login.jsp";
            notify = "此用户名不存在，请核对信息!";
        }
        ResultData resultData = ResultData.success(notify);
        resultData.put("url",nextJsp);
        return resultData;
    }
}
