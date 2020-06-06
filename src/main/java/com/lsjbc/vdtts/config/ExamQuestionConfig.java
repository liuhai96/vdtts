package com.lsjbc.vdtts.config;

import com.lsjbc.vdtts.entity.ExamQuestion;
import com.lsjbc.vdtts.service.impl.ExamTestServiceImpl;
import com.lsjbc.vdtts.service.intf.ExamTestService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Async;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: ExamQuestionConfig
 * @Description: 题库配置类
 * 题库中的数据会非常庞大，如果用户点击题库时再去获取题库，很耗时间
 * 这里我们可以在项目启动时，把题库和答案遍历出来，保存在内存中
 * 后期设置一个定时任务，定时的去更新内存中的题库
 * @Datetime: 2020/6/6   16:32
 * @Author: JX181114 - 郑建辉
 */
@Configuration
public class ExamQuestionConfig {

    /**
     * 科目四题库的Bean名
     */
    public static final String QUESTION_BANK_4 = "QuestionBank4";

    /**
     * 科目一题库的Bean名
     */
    public static final String QUESTION_BANK_1 = "QuestionBank1";

    /**
     * 程序启动时生成科目四题库
     * 注意
     * 极其耗时，上线时才放开
     *
     * @param service
     * @return 科目四题库
     * @author JX181114 --- 郑建辉
     */
    @Async
    @Bean(name = ExamQuestionConfig.QUESTION_BANK_4)
    public Map<Integer, List<ExamQuestion>> generateQuestionBank4(@Qualifier(ExamTestServiceImpl.NAME) ExamTestService service) {
        return service.generateText(4);
//        return null;
    }

    /**
     * 程序启动时生成科目一题库
     * 注意
     * 极其耗时，上线时才放开
     *
     * @param service
     * @return 科目四题库
     * @author JX181114 --- 郑建辉
     */
    @Async
    @Bean(name = ExamQuestionConfig.QUESTION_BANK_1)
    public Map<Integer, List<ExamQuestion>> generateQuestionBank1(@Qualifier(ExamTestServiceImpl.NAME) ExamTestService service) {
        return service.generateText(1);
//        return null;
    }
}
