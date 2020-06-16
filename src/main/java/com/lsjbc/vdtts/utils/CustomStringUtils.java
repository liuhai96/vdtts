package com.lsjbc.vdtts.utils;

/**
 * @ClassName: CustomStringUtils
 * @Description: 字符串工具类
 * @Datetime: 2020/6/16   0:00
 * @Author: JX181114 - 郑建辉
 */
public class CustomStringUtils {

    /**
     * 身份证号加密
     *
     * @param idNumber 身份证号码
     * @return 加密之后的身份证号码
     */
    public static String encryptionIdCardNumber(String idNumber) {
        try {
            return idNumber.substring(0, 3) + "***********" + idNumber.substring(14);
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < idNumber.length(); i++) {
                sb.append("*");
            }

            return sb.toString();
        }
    }

}
