package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.pojo.vo.ExamSimulateRecordAdd;

/**
 * @ClassName: ExamSimulateRecordService
 * @Description: 模拟考试成绩的Service层
 * @Datetime: 2020/6/8   10:59
 * @Author: JX181114 - 郑建辉
 */
public interface ExamSimulateRecordService {

    /**
     * 根据VO对象，来生成一个新的模拟考试成绩记录
     *
     * @param object VO对象
     * @return 受影响的条数
     * @author JX181114 --- 郑建辉
     */
    Integer insertNewData(ExamSimulateRecordAdd object);


}
