package com.lsjbc.vdtts.pojo.bo.aliai.client;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import lombok.*;
import org.springframework.stereotype.Component;

/**
 * @ClassName: AliAiClientFactory
 * @Description: 阿里AI的Client对象
 * @Datetime: 2020/6/21   13:31
 * @Author: JX181114 - 郑建辉
 */
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Component(AliAiClientFactory.NAME)
public class AliAiClientFactory {

    /**
     * Bean名
     */
    public static final String NAME = "AliAiClientFactory";

    /**
     * 阿里短信接口的数据
     */
    private final String SMS_AK = "LTAImj67ZtliYTl5";
    private final String SMS_SK = "zrvOOytVkuEMSxIgpRrwAArdaVt9W7";

    /**
     * 阿里短信客户端
     */
    private IAcsClient clientSMS;

    /**
     * 生成发送短信的阿里接口客户端
     * @return
     */
    public synchronized IAcsClient getSmsClient(){
        if(clientSMS==null) {
            DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", SMS_AK, SMS_SK);
            clientSMS=new DefaultAcsClient(profile);
        }
        return clientSMS;
    }


    /**
     * @Description 生成用于支付宝支付的阿里客户端
     * @Author
     * @Date
     * @Param
     * @Return      com.aliyun.api.AlipayClient
     */
    //调用网关地址
    public static final String URL = "https://openapi.alipaydev.com/gateway.do";
    //APP_ID
    public static final String APP_ID = "2016093000629229";
    //APP私钥
    public static final String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCPOq8mWmQ3Wg8zNErKjVXo6csR1cHuAYe996mwX6ztyalnv0TVnUBGweUE4s/EKgiuBwCgdhS4rzLNbOk++G0ufFuwu5kz3cpuTHPebpgBziWKBf78hCUuvZyXr36UuNjBMtnNO67VieZ/fEKJSN4qj4yVySNZrdC1I30BQR2Z5TpVbUBq4+R7L8Fx+hwzVBfXP9vuQHXsQhiKfwsA5vXT5iJG+vLnokfxxi9G4x3W8SOUqc29vk0rbluukqGYpCQKa1r+/8WQD3m8AO5TEbbQ+U/aARdkxO+aocqIG8GZ1r75TrgJIVCSE5LGKYEZVlTqmCBAhVC8IctUrI+ks+w5AgMBAAECggEAZXXjxx53KYLBi7s6U/wE5IZhVNQAmbI5z0dWzFsqLBQTzit+/ndzpewKaQimt0Yzedv6BLFBAocRTNYe8H2ZEjoD1dE+uLAfizzbQ7FCOt0mWHzg4U5W7KJjAEzQNVgwK8Py5+CkfB5AywRiOdAFmU6w/xZJ1Wg8lWR7U90ls/LPpfylv28X6yuqn/SrTIC3mDsW9AvaBJlME85Eo21gX6R4yu4cgmQqkMINGviv+CCj9EaYkHnjRICadjt8C6/h7fuYLTCyNCgOeL1eaE47hXORK5ejL/ppBvqRtfD191XPfIwkUrmG7aovlARTwn9GhZrYgVSJjPRnGATMLlGIEQKBgQDDFA0NuKdC6eXVeTkdMtx0RDPnISMkCm+R+/MJXocDbWp3NMTjj4B/KJseBGnCkpOQiL9/c/nVhf+pY9C13PcqGRoHvrH5n00dhDHU0ho+LUBrwwf9v0dbRX+wVUzIQXkMdGSjtyTBFFuj6Tgm0Q4xBM1OES56YyA67rG8iP6dBQKBgQC79XK6Obv/b30SwXGzEcKPkaRuKf97Vf7KWq2CNlKU1YZY1D9yxPD7t03aKTQK3rkfMpyC6RJ9fTvtQGKtRDnYk5ggp0cwOUrhCpZbYnJ6ocZz4QRYUXjJmSdqDw+wo0z30KepI98dwLBMysHane9MuddtEZskqgWjiqUPYlNYpQKBgFJbYLduQY8KWDGrn+Un19JuCMuHPeK1VSz4hT5rXeyggNYavRSlPMZySip+CnhOkWXvlYklWVA/5hOJRE/DHcX0Gv0yEMkl69SOPstueA3P5OaZzAHggyuRR7sWB/hzS7tqWCKV6zpocdfdWgtpLuia8mIG9uxMdQrsQrUp0PRRAoGAak3151GD/IJH0PXLoqWmzqBmyU/DiTQn+La0b3Ld3gOuCktw3y53xUX1KDApmQRC21w6nOfJZ2QPIq5JoQl3VgCUB9PUNXgR25mrVGAnsygQH7XiSTk7AXo3ioqeKx8RBw/h443AQQmcLLJ4VXcBwvlQ2AUfI+ttaQOfO0Y3MWkCgYEAogVt4lZuib3MfffLgv4/7pmBvqnqMiby3jbKmxcmyGzRDo1QUfPGQ6DkOe1jnieFMi7Upcj93Ph8ucQoeWg9yxJw5hUEnne9dPyO9hLNcAxw9X5sy+DA/84p2fETmKlMdUwRXs1L5btB/41V6E1rWTvnITfyNzKQl2ex77KApwA=";
    //返回格式
    public static final String FORMAT = "json";
    //字符编码集
    public static final String CHARSET = "UTF-8";
    //支付宝公钥
    public static final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsrMyvH5A9+Fmd14apOO6vgfOISeh6peOkWmJxCZgL0sIbtQcn2PVf5rrPHVA8aEwRRst6QCKtW1raQKmAJrmHjFYaRxYRxMraqxtaX4R4WlIhdlbocq9i/Z6awmVa7CUB/ehn2VzwJOBVC80+HP9C9VI4Pnpj/TsUwYkw3NL8tCT9/O5hmbiQZ25oS1QzoAMt1WukPm8nfYnBF9o+ZVc+IbwouUeHwaQpHpVhxMRU/NSwybicKLAfl3ttfqyrzvOaCKO53GDaJswCihKISJvthZOk+XaEHUTZAmJd+JsLwPlt/nrjy+3GHOcajaSuYC6RXtkfMWC+EeckzcqWmU0iwIDAQAB";
    //签名类型
    public static final String SIGN_TYPE = "RSA2";

    //支付客户端
    private AlipayClient clientPay;
    /**
     * @Description 生成用于支付宝支付的阿里客户端
     * @Author
     * @Date
     * @Param  []
     * @Return      com.aliyun.api.AlipayClient
     */
    public AlipayClient getPayClient(){
        if(clientPay==null){
            clientPay =new DefaultAlipayClient(URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
        }
        return  clientPay;
    }
}
