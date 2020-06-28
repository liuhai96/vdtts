package com.lsjbc.vdtts.pojo.bo.aliai;


import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.lsjbc.vdtts.pojo.bo.aliai.client.AliAiClientFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * @BelongsProject: SmartGuard
 * @BelongsPackage: com.zjh.utils.aliyun.aliyunTools
 * @Author: 25940
 * @CreateTime: 2019-08-12 14:25
 * @Description: 阿里支付工具
 */
@Component
public class Pay {

    @Autowired
    private AliAiClientFactory aliAiClientFactory;

    /**
     * @Description 支付宝支付
     * @Author  ZhengJianHui
     * @Date   2019/7/27 16:00
     * @Param  [response, newUser]
     * @Return      void
     */
    public void pay(HttpServletResponse response, Map<String,String> data){

        //设置返回的格式
        response.setHeader("Content-type", "text/html; charset=UTF-8");

        //获取支付对象
        AlipayClient alipayClient= aliAiClientFactory.getPayClient();

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

        //设置异步回调地址
        alipayRequest.setReturnUrl(data.get("RETURN_URL").toString());

        //设置同步回调地址
        alipayRequest.setNotifyUrl(data.get("NOTIFY_URL").toString());

        try {
            //添加请求参数
            alipayRequest.setBizContent(getPayBizContent(data));

            //请求
            String result = alipayClient.pageExecute(alipayRequest).getBody();

            response.getWriter().write(result);
        } catch (UnsupportedEncodingException e){
            e.printStackTrace();
        } catch (AlipayApiException e2) {
            e2.printStackTrace();
        } catch (IOException e3){
            e3.printStackTrace();
        }
    }

    /**
     * @Description 根据传入参数的不同来拼接不同的请求
     * @Author  ZhengJianHui
     * @Date   2019/7/28 10:02
     * @Param  [newUser]
     * @Return      java.lang.String
     */
    private String getPayBizContent(Map<String,String> data){
        StringBuffer stringBuffer=new StringBuffer("{");
        if(data.get("out_trade_no")!=null){//订单编号
            stringBuffer.append("\"out_trade_no\":\""+data.get("out_trade_no").toString()+"\",");
        }
        if(data.get("total_amount")!=null){//订单金额
            stringBuffer.append("\"total_amount\":\""+data.get("total_amount").toString()+"\",");
        }
        if(data.get("subject")!=null){//商品名称
            stringBuffer.append("\"subject\":\""+data.get("subject").toString()+"\",");
        }

        stringBuffer.append("\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        return stringBuffer.toString();
    }
}
