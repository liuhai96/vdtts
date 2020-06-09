package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.ExamQuestion;

import java.util.List;

/**
 * @ClassName: ExamErrorService
 * @Description: 模拟考试错题集的Service层
 * @Datetime: 2020/6/9   14:42
 * @Author: JX181114 - 郑建辉
 */
public interface ExamErrorService {

    /**
     * 根据模拟考试记录的ID，来查找错题集合
     *
     * @param recordId 模拟考试ID
     * @return 错题集合
     */
    List<ExamQuestion> getErrorQuestionByRecordId(Integer recordId);

}
