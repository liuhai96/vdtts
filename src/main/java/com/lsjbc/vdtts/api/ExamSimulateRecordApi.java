package com.lsjbc.vdtts.api;

import com.lsjbc.vdtts.pojo.vo.ResultData;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName: ExamSimulateRecordApi
 * @Description: 关于模拟考试成绩的一些Api接口
 * @Datetime: 2020/6/8   10:19
 * @Author: JX181114 - 郑建辉
 */
@CrossOrigin
@RestController
@RequestMapping("api/exam")
public class ExamSimulateRecordApi {

    @PutMapping("record")
    public ResultData a(){
        return null;
    }
}
