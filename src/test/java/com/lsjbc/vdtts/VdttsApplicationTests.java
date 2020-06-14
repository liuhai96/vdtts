package com.lsjbc.vdtts;

import com.lsjbc.vdtts.dao.*;
import com.lsjbc.vdtts.dao.mapper.CarMapper;
import com.lsjbc.vdtts.dao.mapper.EvaluateMapper;
import com.lsjbc.vdtts.dao.mapper.NoticeMapper;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Random;

@SpringBootTest
class VdttsApplicationTests {

    @Resource
    private NoticeMapper noticeMapper;

    @Resource
    private EvaluateMapper evaluateMapper;

    @Resource
    private CarMapper carMapper;

    @Resource(name = ExamQuestionDao.NAME)
    private ExamQuestionDao examQuestionDao;

    @Resource(name = ExamAnswerDao.NAME)
    private ExamAnswerDao examAnswerDao;

    @Resource(name = ExamSimulateRecordDao.NAME)
    private ExamSimulateRecordDao examSimulateRecordDao;

    @Resource(name = EvaluateDao.NAME)
    private EvaluateDao evaluateDao;

    @Resource(name = CarDao.NAME)
    private CarDao carDao;

    @Resource(name = TeacherDao.NAME)
    private TeacherDao teacherDao;

    @Resource(name = StudentDao.NAME)
    private StudentDao studentDao;

    @Resource(name = SchoolDao.NAME)
    private SchoolDao schoolDao;

    Random ra = new Random();

    @Test
    void contextLoads() {
    }
}
