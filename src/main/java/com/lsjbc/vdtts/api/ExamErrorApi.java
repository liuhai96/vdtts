package com.lsjbc.vdtts.api;

import com.lsjbc.vdtts.pojo.vo.ExamQuestionWithEeId;
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

    /**
     * 根据模拟考试ID，来获取错题集合
     *
     * @param recordId 模拟考试Id
     * @return 错题集合
     * @author JX181114 --- 郑建辉
     */
    @GetMapping("error/{recordId}")
    public ResultData getErrorQuestion(@PathVariable("recordId") Integer recordId) {

        ResultData resultData = null;

        try {
            List<ExamQuestionWithEeId> questionList = examErrorService.getErrorQuestionByRecordId(recordId);

            resultData = ResultData.success("questions", questionList);

        } catch (Exception e) {
            e.printStackTrace();
            resultData = ResultData.error(e.getMessage());
        }

        return resultData;
    }


    /**
     * 重新做错题，并正确之后，向数据库发起删除指定错题的申请
     *
     * @param ids 错题记录ID集合
     * @return 删除结果
     * @author JX181114 --- 郑建辉
     */
    @DeleteMapping("error")
    public ResultData deleteErrorQuestion(Integer[] ids) {
        ResultData resultData = null;
        
        try {
            Integer row = examErrorService.deleteErrorQuestionByRecordId(ids);

            if(ids.length==row){
                resultData = ResultData.success();
            } else {
                resultData = ResultData.warning("传入参数数量和删除数量不一致");
            }

        } catch (Exception e) {
            resultData = ResultData.error(e.getMessage());
        }


        return resultData;
    }
}
