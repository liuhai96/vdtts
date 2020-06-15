package com.lsjbc.vdtts;

import com.lsjbc.vdtts.dao.ExamAnswerDao;
import com.lsjbc.vdtts.dao.ExamQuestionDao;
import com.lsjbc.vdtts.dao.ExamSimulateRecordDao;
import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import com.lsjbc.vdtts.entity.ExamAnswer;
import com.lsjbc.vdtts.entity.ExamQuestion;
import com.lsjbc.vdtts.entity.ExamSimulateRecord;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.utils.CustomTimeUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.*;

@SpringBootTest
class VdttsApplicationTests {

    @Resource(name = ExamQuestionDao.NAME)
    private ExamQuestionDao examQuestionDao;

    @Resource(name = ExamAnswerDao.NAME)
    private ExamAnswerDao examAnswerDao;

    @Resource(name = ExamSimulateRecordDao.NAME)
    private ExamSimulateRecordDao examSimulateRecordDao;

    Random ra = new Random();

    @Test
    void contextLoads() {

    }


}
