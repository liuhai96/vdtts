package com.lsjbc.vdtts.controller;


import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lsjbc.vdtts.dao.PayDao;
import com.lsjbc.vdtts.entity.ExamParam;
import com.lsjbc.vdtts.entity.PayFee;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.bo.aliai.Pay;
import com.lsjbc.vdtts.pojo.bo.aliai.client.AliAiClientFactory;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.utils.CustomTimeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLOutput;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
@RestController
@RequestMapping(value = "/aliPayController")
public class AliPayController {
    @Resource
    private Pay alipay;
    @Resource
    private  PayDao payDao;
    public PayFee payFee1 = null;

    @RequestMapping(value = "/pay")
    public void payTest (HttpServletResponse response, PayFee payFee){
        payFee.setFeeTime(CustomTimeUtils.getNowTimeString1());
        System.out.println("payfee list ="+payFee );

        Map<String,String> maptest = new HashMap<>();
        //支付成功后跳转路径(异步)
        maptest.put("RETURN_URL","http://localhost:8080/aliPayController/paystatu");
        //支付成功后跳转路径(同步)
        maptest.put("NOTIFY_URL","http://122.51.57.9:8080/index");
        //订单编号：订单时间+学员id
        String out_trade_no=payFee.getStudentId()+System.currentTimeMillis()+"";
        maptest.put("out_trade_no", out_trade_no);
        //订单金额
        maptest.put("total_amount",payFee.getRegisterFee());
        //商品名称
        maptest.put("subject",payFee.getSchoolName());

        alipay.pay(response,maptest);
        payFee1 = payFee;
//        int i = payDao.add(payFee);
//        if(i>0){
//            System.out.println("payId>>>>>>"+payFee.getPayId());
//            System.out.println("学员支付信息添加成功，进入支付界面");
//            payFee1 = payFee;
//        }else {
//            System.out.println("学员缴费支付信息添加失败");
//        }
    }


    @ResponseBody
    @RequestMapping("paystatu")
    public void returnurl(HttpServletRequest request, HttpServletResponse Response) throws IOException, AlipayApiException {
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        ModelAndView modelAndView = new ModelAndView();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
        //商户订单号

        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

        //支付宝交易号

        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
        //计算得出通知验证结果
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean verify_result = AlipaySignature.rsaCheckV1(params, AliAiClientFactory.ALIPAY_PUBLIC_KEY, AliAiClientFactory.CHARSET, "RSA2");

        if (verify_result) {//验证成功
//            //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
//            Response.getWriter().write("sssss"+trade_no);
            System.out.println("商家订单号=："+trade_no);
        }
//        Response.getWriter().write("fffffff"+out_trade_no);
        System.out.println("收款方自定义订单号=："+out_trade_no);
        if(out_trade_no!=null&!out_trade_no.equals("")){
            payFee1.setOrderNumber(out_trade_no);
            payFee1.setPayStatu("true");
            System.out.println("payFee1=："+payFee1.toString());
            int i = payDao.add(payFee1);
            if(i>0){
                System.out.println("订单添加成功");
            }else {
                System.out.println("订单添加失败");
            }
        }
//        modelAndView.setViewName("pages/index/inquire_school");
//        return modelAndView;

    }

    @RequestMapping(value = "/selectPayInfo")//初始化支付信息表
    public LayuiTableData selectPayInfo(HttpServletRequest request, HttpServletResponse response, int page , int limit, PayFee payFee) {
//		System.out.println("examlist"+examParam.toString());
        Page<PayFee> pageinfo = PageHelper.startPage(page,limit,true);
        payDao.selectPayInfo(payFee.getSchoolName());
        LayuiTableData layuiData = new LayuiTableData();
        layuiData.setCode(0);
        layuiData.setData(pageinfo.getResult());
        layuiData.setCount(pageinfo.getTotal());
        return layuiData;
    }
}
