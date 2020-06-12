package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.ExamQuestion;
import com.lsjbc.vdtts.pojo.vo.ExamQuestionWithEeId;

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
     * @author JX181114 --- 郑建辉
     */
    List<ExamQuestionWithEeId> getErrorQuestionByRecordId(Integer recordId);

    /**
     * 根据错题ID来删除记录
     *
     * @param ids 错题ID集合
     * @return 受影响条数
     * @author JX181114 --- 郑建辉
     */
    Integer deleteErrorQuestionByRecordId(Integer[] ids);

}