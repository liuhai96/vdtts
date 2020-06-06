package com.lsjbc.vdtts.pojo.dto;

import com.lsjbc.vdtts.entity.ExamQuestion;
import com.lsjbc.vdtts.service.impl.ExamTestServiceImpl;
import com.lsjbc.vdtts.service.intf.ExamTestService;
import lombok.*;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: QuestionBank
 * @Description: 题库对象
 * @Datetime: 2020/6/6   23:35
 * @Author: JX181114 - 郑建辉
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Component(QuestionBank.NAME)
public class QuestionBank {

    public static final String NAME = "QuestionBank";

    /**
     * 科目一题库
     */
    private Map<Integer, List<ExamQuestion>> bank1;

    /**
     * 科目四题库
     */
    private Map<Integer, List<ExamQuestion>> bank4;

    @Resource(name = ExamTestServiceImpl.NAME)
    private ExamTestService service;

    /**
     * 题库中的数据会非常庞大，如果用户点击题库时再去获取题库，很耗时间
     * 这里我们可以在项目启动时，把题库和答案遍历出来，保存在内存中
     * 后期设置一个定时任务，定时的去更新内存中的题库
     * 极其耗时，上线时才放开
     */
    @Async
    @PostConstruct
    public void init(){
//        bank1=service.generateText(1);
//        bank4=service.generateText(4);
        System.out.println("正在更新内存中的题库");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("更新内存中的题库完成");
    }
}
