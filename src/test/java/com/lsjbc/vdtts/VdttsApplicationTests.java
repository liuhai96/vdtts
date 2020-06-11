package com.lsjbc.vdtts;

import com.lsjbc.vdtts.dao.ExamAnswerDao;
import com.lsjbc.vdtts.dao.ExamQuestionDao;
import com.lsjbc.vdtts.dao.ExamSimulateRecordDao;
import com.lsjbc.vdtts.entity.ExamAnswer;
import com.lsjbc.vdtts.entity.ExamQuestion;
import com.lsjbc.vdtts.entity.ExamSimulateRecord;
import com.lsjbc.vdtts.utils.CustomTimeUtils;
import org.junit.jupiter.api.Test;
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
        for (int i=0;i<25;i++){
            int year = 2020;
            int month = (ra.nextInt(12))+1;
            int day = (ra.nextInt(31))+1;
            int hour = ra.nextInt(24);
            int min = ra.nextInt(60);
            int se = ra.nextInt(60);
            int score = ra.nextInt(101);
            ExamSimulateRecord record = ExamSimulateRecord.builder()
                    .esrStudentId(1).esrLevel(1).esrScore(score).esrTime(""+year+"/"+month+"/"+day+" "+hour+":"+min+":"+se+"")
                    .build();

            examSimulateRecordDao.add(record);
        }
    }


}
