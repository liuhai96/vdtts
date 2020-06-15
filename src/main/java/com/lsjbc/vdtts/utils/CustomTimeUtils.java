package com.lsjbc.vdtts.utils;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * @ClassName: CustomTimeUtils
 * @Description: 自定义的时间工具类
 * @Datetime: 2020/6/8   11:05
 * @Author: JX181114 - 郑建辉
 */
public class CustomTimeUtils {

    /**
     * 获取特定格式的时间  年/月/日 时：分：秒
     *
     * @return 年/月/日 时：分：秒格式的时间
     * @author JX181114 --- 郑建辉
     */
    public static String getNowTimeString1() {
        LocalDateTime nowDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String format = nowDate.format(formatter);
        return format;
    }

    /**
     * 根据传入的毫秒数生成指定的时间  年/月/日 时：分：秒
     *
     * @param mill 当前时间戳
     * @return 年/月/日 时：分：秒格式的时间
     * @author JX181114 --- 郑建辉
     */
    public static String getTimeStringFromMills(Long mill) {
        LocalDateTime localDateTime = new Date(mill).toInstant().atOffset(ZoneOffset.of("+8")).toLocalDateTime();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String format = localDateTime.format(formatter);
        return format;
    }

    /**
     * 将秒数转换为具体时间长度
     * 从秒到天
     *
     * @param seconds 秒数
     * @return n秒/n分n秒/n小时n分n秒/n天n小时n分n秒
     */
    public static String turnSecondsToString(Integer seconds) {

        Integer minute = seconds / 60;

        if (minute == 0) {
            return seconds + "秒";
        }

        seconds = seconds - (minute * 60);

        if (minute < 60) {
            return minute + "分" + seconds + "秒";
        }

        Integer hour = minute / 60;

        minute = minute - hour * 60;

        if (hour < 24) {
            return hour + "小时" + minute + "分钟" + seconds + "秒";
        }

        Integer day = hour / 24;

        hour = hour - day * 24;

        return day + "天" + hour + "小时" + minute + "分钟" + seconds + "秒";
    }
}
