package com.lsjbc.vdtts.controller;


import com.lsjbc.vdtts.dao.PayDao;
import com.lsjbc.vdtts.entity.PayFee;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.bo.aliai.Pay;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLOutput;
import java.util.HashMap;
import java.util.Map;
@Controller
@RequestMapping(value = "aliPayController")
public class AliPayController {
    @Resource
    private Pay alipay;
    @Resource
    private  PayDao payDao;

    @RequestMapping(value = "pay")
    public void payTest (HttpServletResponse response, PayFee payFee, HttpServletRequest request){
        Map<String,String> maptest = new HashMap<>();
        //支付成功后跳转路径(异步)
        maptest.put("RETURN_URL","http://122.51.57.9:8080/index");
        //支付成功后跳转路径(同步)
        maptest.put("NOTIFY_URL","http://122.51.57.9:8080/index");
        //订单编号：订单时间+学员id
        maptest.put("out_trade_no", payFee.getStudentId()+System.currentTimeMillis()+"");
        //订单金额
        maptest.put("total_amount",payFee.getRegisterFee());
        //商品名称
        maptest.put("subject",payFee.getSchoolName());

        alipay.pay(response,maptest);

        Student student = (Student) request.getSession().getAttribute("student");

        System.out.println("payfee list ="+payFee );
        System.out.println("student list ="+student );
        int i = payDao.add(payFee);
        if(i>0){
            System.out.println("学员缴费成功");
        }else {
            System.out.println("学员缴费失败");
        }
    }
}
