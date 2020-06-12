package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.ExamAnswerDao;
import com.lsjbc.vdtts.dao.ExamErrorDao;
import com.lsjbc.vdtts.dao.ExamQuestionDao;
import com.lsjbc.vdtts.entity.ExamError;
import com.lsjbc.vdtts.entity.ExamQuestion;
import com.lsjbc.vdtts.pojo.vo.ExamQuestionWithEeId;
import com.lsjbc.vdtts.service.intf.ExamErrorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

/**
 * @ClassName: ExamErrorServiceImpl
 * @Description:
 * @Datetime: 2020/6/9   15:24
 * @Author: JX181114 - 郑建辉
 */
@Service("ExamErrorService")
public class ExamErrorServiceImpl implements ExamErrorService {

    /**
     * Bean名
     */
    public static final String NAME = "ExamErrorService";

    @Resource(name = ExamErrorDao.NAME)
    private ExamErrorDao examErrorDao;

    @Resource(name = ExamQuestionDao.NAME)
    private ExamQuestionDao examQuestionDao;

    @Resource(name = ExamAnswerDao.NAME)
    private ExamAnswerDao examAnswerDao;

    /**
     * 根据模拟考试记录的ID，来查找错题集合
     *
     * @param recordId 模拟考试ID
     * @return 错题集合
     * @author JX181114 --- 郑建辉
     */
    @Override
    public List<ExamQuestionWithEeId> getErrorQuestionByRecordId(Integer recordId) {

        //根据ID查询出所有的错题ID
        List<ExamError> errorQuestion = examErrorDao.getByRecordId(recordId);

        List<ExamQuestionWithEeId> questionList = errorQuestion.stream().map(item -> {

            //根据每一个错题ID来查询出错题
            ExamQuestion question = examQuestionDao.getById(item.getEeQuestionId());

            //根据错题ID查询出错题答案
            question.setAnswers(examAnswerDao.getByQuestionId(item.getEeQuestionId()));

            return new ExamQuestionWithEeId(item,question);
        }).collect(Collectors.toList());

        return questionList;
    }

    /**
     * 根据错题ID来删除记录
     *
     * @param ids 错题ID集合
     * @return 受影响条数
     * @author JX181114 --- 郑建辉
     */
    @Override
    public Integer deleteErrorQuestionByRecordId(Integer[] ids) {
        AtomicReference<Integer> count = new AtomicReference<>(0);

        Arrays.asList(ids).forEach(item->{
            count.updateAndGet(v -> v + examErrorDao.deleteById(item));
        });

        return count.get();
    }
}