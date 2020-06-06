package com.lsjbc.vdtts.entity;

import lombok.Data;

/**
 * @ClassName: ExamAnswer
 * @Description: 题库答案表
 * @Datetime: 2020/6/6   11:29
 * @Author: JX181114 - 郑建辉
 */
@Data
public class ExamAnswer {

    /**
     * ID
     */
    private Integer eaId;

    /**
     * 所属问题ID
     */
    private Integer eaQuestionId;

    /**
     * 答案
     */
    private String eaAnswer;

    /**
     * 是否正确答案
     */
    private String right;

}
