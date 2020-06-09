package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.service.intf.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
    public void UserLogin(HttpServletRequest request, HttpServletResponse response, Account account){
        String nextJsp = null;//下一个界面的路径
        String notify = "";//弹窗通知信息
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html;charset=utf-8");
        account = userLoginService.UserLogin(account);//
        if(account != null){ //登录成功时
            switch (account.getAType()) {
                case "school": nextJsp = "pages/staff/schoolmenu";break;//驾校登录界面地址
                case "student":nextJsp = "pages/s";break;//学员登录界面地址
                case "teacher":nextJsp = "pages/";break;//教练登录界面地址
            }
            request.getSession().setAttribute("account", account);
            notify = "恭喜你，登录成功！";
        } else {//登录失败
            nextJsp = "pages/homepage/login";
            notify = "此用户名不存在，请核对信息!";
        }
        try {
            response.getWriter().write("<script>alert('"+notify+"');location.href='"+nextJsp+".jsp';</script>");
            response.getWriter().flush();
            response.getWriter().close();
        } catch (Exception e) {}
    }
}
