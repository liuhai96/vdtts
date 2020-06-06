package com.lsjbc.vdtts.entity;

import lombok.*;

import javax.persistence.*;

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
@Table(name = "`tb_exam_question`")
public class ExamQuestion {

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "`eq_id`")
    private Integer eqId;

    /**
     * 问题
     */
    @Column(name = "`eq_question`")
    private String eqQuestion;

    /**
     * 路径
     */
    @Column(name = "`eq_pic`")
    private String eqPic;

    /**
     * 科目等级
     */
    @Column(name = "`eq_level`")
    private Integer eqLevel;


}
