package com.lsjbc.vdtts.pojo.vo;

import lombok.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: ResultData
 * @Description: 后台向前台返回的数据格式
 * @Datetime: 2020/6/6   15:07
 * @Author: JX181114 - 郑建辉
 */
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResultData {

    /**
     * 错误代码
     * 正常为0
     * 异常为其他
     */
    @Builder.Default
    private Integer code = 0;

    /**
     * 执行结果后附带的信息
     */
    @Builder.Default
    private String msg = "";

    /**
     * 携带数据
     */
    @Builder.Default
    private Map<String, Object> data = new HashMap<>(10);

    /**
     * 向Data中存入数据
     *
     * @param key   键
     * @param value 值
     */
    public void put(String key, Object value) {
        data.put(key, value);
    }

    /**
     * 设置一个成功的Success对象
     *
     * @return 表示操作成功的ResultData对象
     * @author JX181114 --- 郑建辉
     */
    public static ResultData success() {
        return ResultData.builder().msg("操作成功").build();
    }

    /**
     * 设置一个成功的Success对象，并传入一个数据
     *
     * @param key   数据-键
     * @param value 数据-值
     * @return 表示操作成功的ResultData对象
     * @author JX181114 --- 郑建辉
     */
    public static ResultData success(String key, Object value) {
        ResultData resultData = new ResultData();

        resultData.getData().put(key, value);

        return resultData;
    }

    /**
     * 设置一个出错的Error对象，并设置错误编码和消息
     *
     * @param code 错误编码
     * @param msg  消息
     * @return 表示操作失败的ResultData对象
     * @author JX181114 --- 郑建辉
     */
    public static ResultData error(Integer code, String msg) {
        return ResultData.builder().code(code).msg(msg).build();
    }

    /**
     * 设置一个出错的Error对象，并设置消息
     *
     * @param msg 消息
     * @return 表示操作失败的ResultData对象
     * @author JX181114 --- 郑建辉
     */
    public static ResultData error(String msg) {
        return ResultData.builder().code(-1).msg(msg).build();
    }

    /**
     * 设置一个出错的Error对象
     *
     * @return 表示操作失败的ResultData对象
     * @author JX181114 --- 郑建辉
     */
    public static ResultData error() {
        return ResultData.builder().code(-1).msg("出现未知错误").build();
    }
}
