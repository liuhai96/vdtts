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

    /**
     * 获取登录时使用的验证码
     *
     * @param phone   手机号
     * @param request request域
     */
    @GetMapping("register")
    public void register(String phone, HttpServletRequest request) {
        //模拟验证码登录
        request.getSession().setAttribute("phone", phone);
        request.getSession().setAttribute("r_vc", "000000");
//        sms.registerVC(phone, request);
    }

    /**
     * 获取修改手机号时使用的验证码
     *
     * @param phone   手机号
     * @param request request域
     */
    @GetMapping("update")
    public void update(String phone, HttpServletRequest request) {
        //模拟验证码修改
        request.getSession().setAttribute("phone", phone);
        request.getSession().setAttribute("r_vc", "000000");
//        sms.updateVC(phone, request);
    }

}
