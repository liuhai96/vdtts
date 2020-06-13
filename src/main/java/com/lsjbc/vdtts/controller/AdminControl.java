package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.AccountService;
import com.lsjbc.vdtts.utils.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *@Description:
 *@Author:李浪_191019
 *@Param:account 含有登录账号密码的登录实例类
 *@return:aType表明，aId登录成功后的登录者Id,
 *@Date:2020/6/8 1:30
 **/
@Controller
@RequestMapping
public class AdminControl {
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/userLogin")
    @ResponseBody
    public ResultData UserLogin(HttpServletRequest request, HttpServletResponse response, Account account){
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html;charset=utf-8");
        account.setAPassword(new Tool().createMd5(account.getAPassword()));//转MD5码（加密）
        return accountService.UserLogin(account,request);
    }
}
