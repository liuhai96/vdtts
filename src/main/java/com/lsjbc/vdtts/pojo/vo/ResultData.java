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
}
