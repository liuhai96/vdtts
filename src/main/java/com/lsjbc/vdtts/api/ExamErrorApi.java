package com.lsjbc.vdtts.api;

import com.lsjbc.vdtts.entity.ExamQuestion;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.impl.ExamErrorServiceImpl;
import com.lsjbc.vdtts.service.intf.ExamErrorService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName: ExamErrorApi
 * @Description: 关于模拟考试错题的一些接口
 * @Datetime: 2020/6/9   14:35
 * @Author: JX181114 - 郑建辉
 */
@CrossOrigin
@RestController
@RequestMapping("api/exam")
public class ExamErrorApi {

    @Resource(name = ExamErrorServiceImpl.NAME)
    private ExamErrorService examErrorService;

    @GetMapping("error/{recordId}")
    public ResultData getErrorQuestion(@PathVariable("recordId")Integer recordId){

        ResultData resultData = null;

        try {
            List<ExamQuestion> questionList = examErrorService.getErrorQuestionByRecordId(recordId);

            resultData = ResultData.success("questions",questionList);

        } catch (Exception e){
            e.printStackTrace();
            resultData = ResultData.error(e.getMessage());
        }

        return resultData;
    }
}
