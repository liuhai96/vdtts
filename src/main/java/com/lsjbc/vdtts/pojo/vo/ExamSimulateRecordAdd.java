package com.lsjbc.vdtts.pojo.vo;

import com.lsjbc.vdtts.entity.ExamSimulateRecord;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * @ClassName: ExamSimulateRecordAdd
 * @Description: 前端向后端提交新的模拟考试成绩时提交的对象
 * @Datetime: 2020/6/8   10:37
 * @Author: JX181114 - 郑建辉
 */
public class ExamSimulateRecordAdd {

    /**
     * 前端传入的学员ID
     */
    @Min(value = 0, message = "学员ID不能小于1")
    private Integer studentId;

    /**
     * 前端传入的模拟考试分数
     */
    @Min(value = -1, message = "模拟考试成绩不得小于0")
    @Max(value = 101, message = "模拟考试成绩不得大于100")
    private Integer score;

    /**
     * 前端传入的科目等级
     */
    private Integer level;

    /**
     * 根据现有对象，创建出一个ExamSimulateRecord对象
     *
     * @return ExamSimulateRecord对象
     * @author JX181114 --- 郑建辉
     */
    public ExamSimulateRecord createBean() {
        return ExamSimulateRecord.builder().esrLevel(level).esrStudentId(studentId).esrScore(score).build();
    }
}
