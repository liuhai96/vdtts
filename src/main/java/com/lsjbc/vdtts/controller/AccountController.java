package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
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

/**
 * @author LiLang9725
 * @date 2020/6/13 23:39
 */
/*
 *@Description:
 *@Author:李浪_191019
 *@Param:account 含有登录账号密码的登录实例类
 *@return:aType表明，aId登录成功后的登录者Id,
 *@Date:2020/6/8 1:30
 **/
@Controller
@RequestMapping
public class AccountController {
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/userLogin")
    @ResponseBody
    /*
     *@Description:登录
     *@Author:李浪_191019
     *@Param:[request, response, account]
     *@return:com.lsjbc.vdtts.pojo.vo.ResultData
     *@Date:2020/6/13 23:36
     **/
    public ResultData UserLogin(HttpServletRequest request, HttpServletResponse response, Account account){
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html;charset=utf-8");
//        account.setAPassword(new Tool().createMd5(account.getAPassword()));//转MD5码（加密）
        return accountService.UserLogin(account,request);
    }

    @RequestMapping(value = "/verifyAdmin")
    @ResponseBody
    /*
     *@Description:密码验证
     *@Author:李浪_191019
     *@Param:[account]
     *@return:java.lang.String
     *@Date:2020/6/13 23:35
     **/
    public String VerifyAdmin(Account account){
        account.setAPassword(new Tool().createMd5(account.getAPassword()));
        return JSON.toJSONString(accountService.verifyPass(account));
    }
    @RequestMapping(value = "/changePassword")
    @ResponseBody
    public String changePassword(Account account){
        account.setAPassword(new Tool().createMd5(account.getAPassword()));
        return JSON.toJSONString(accountService.updatePass(account));
    }
}
