package com.lsjbc.vdtts.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lsjbc.vdtts.dao.ExamSimulateRecordDao;
import com.lsjbc.vdtts.entity.ExamSimulateRecord;
import com.lsjbc.vdtts.pojo.vo.ExamSimulateRecordAdd;
import com.lsjbc.vdtts.service.intf.ExamSimulateRecordService;
import com.lsjbc.vdtts.utils.CustomTimeUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName: ExamSimulateRecordServiceImpl
 * @Description: 模拟考试成绩的Service层的实现类
 * @Datetime: 2020/6/8   11:00
 * @Author: JX181114 - 郑建辉
 */
@Service(ExamSimulateRecordServiceImpl.NAME)
public class ExamSimulateRecordServiceImpl implements ExamSimulateRecordService {

    /**
     * Bean名
     */
    public static final String NAME = "ExamSimulateRecordService";

    @Resource(name = ExamSimulateRecordDao.NAME)
    private ExamSimulateRecordDao simulateRecordDao;

    /**
     * 根据VO对象，来生成一个新的模拟考试成绩记录
     *
     * @param object VO对象
     * @return 受影响的条数
     * @author JX181114 --- 郑建辉
     */
    @Override
    public Integer insertNewData(ExamSimulateRecordAdd object) {

        //根据现有的VO对象来生成一个新的记录
        ExamSimulateRecord record = object.createBean();

        //将当前时间填入到记录中
        record.setEsrTime(CustomTimeUtils.getTime1());

        return simulateRecordDao.add(record);
    }

    /**
     * 以学员ID，科目等级为搜索条件进行分页搜索模拟考试成绩
     *
     * @param studentId 学员ID
     * @param level     科目等级
     * @param pageIndex 要查询的分页页数
     * @return 分页信息
     * @author JX181114 --- 郑建辉
     */
    @Override
    public Page<ExamSimulateRecord> getRecordByIdLevelAndPageIndex(Integer studentId, Integer level, Integer pageIndex) {
        Page<ExamSimulateRecord> page = PageHelper.startPage(pageIndex,10,true);
        simulateRecordDao.getByStudentIdAndLevel(studentId, level);
        return page;
    }
}
