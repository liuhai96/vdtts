package com.lsjbc.vdtts.config;

import org.springframework.context.annotation.Configuration;

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
}
