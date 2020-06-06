package com.lsjbc.vdtts.entity;

import lombok.*;

/**
 * @ClassName: ExamQuestion
 * @Description: 题库表
 * @Datetime: 2020/6/6   11:25
 * @Author: JX181114 - 郑建辉
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ExamQuestion {

    /**
     * ID
     */
    private Integer eqId;

    /**
     * 问题
     */
    private String eqQuestion;

    /**
     * 路径
     */
    private String eqPic;

    /**
     * 科目等级
     */
    private Integer eqLevel;


}
