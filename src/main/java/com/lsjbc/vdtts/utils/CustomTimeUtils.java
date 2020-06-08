package com.lsjbc.vdtts.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @ClassName: CustomTimeUtils
 * @Description: 自定义的时间工具类
 * @Datetime: 2020/6/8   11:05
 * @Author: JX181114 - 郑建辉
 */
public class CustomTimeUtils {

    /**
     * 获取特定格式的时间  年/月/日 时：分：秒
     * @return
     * @author JX181114 --- 郑建辉
     */
    public static String getTime1(){
        LocalDateTime nowDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String format = nowDate.format(formatter);
        return format;
    }
}
