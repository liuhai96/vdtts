package com.lsjbc.vdtts.api;

import com.lsjbc.vdtts.pojo.bo.aliai.SMS;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName: SMSApi
 * @Description:
 * @Datetime: 2020/6/21   15:30
 * @Author: JX181114 - 郑建辉
 */
@CrossOrigin
@RestController
@RequestMapping("api/sms")
public class SMSApi {

    @Resource(name = SMS.NAME)
    private SMS sms;

    @GetMapping("register")
    public void register(String phone, HttpServletRequest request){

        //模拟验证码登录
        request.getSession().setAttribute("phone",phone);
        request.getSession().setAttribute("r_vc","000000");
//        sms.registerVC(phone, request);
    }

    @GetMapping("update")
    public void update(String phone, HttpServletRequest request){
        sms.updateVC(phone, request);

        System.out.println(request.getSession().getAttribute("phone"));
        System.out.println(request.getSession().getAttribute("u_vc"));
    }

}
