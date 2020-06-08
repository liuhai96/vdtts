package com.lsjbc.vdtts.api;

import com.lsjbc.vdtts.pojo.vo.ExamSimulateRecordAdd;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.impl.ExamSimulateRecordServiceImpl;
import com.lsjbc.vdtts.service.intf.ExamSimulateRecordService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

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

    @Resource(name = ExamSimulateRecordServiceImpl.NAME)
    private ExamSimulateRecordService examSimulateRecordService;

    /**
     * 前天用户新增模拟考试记录
     *
     * @param object 数据传输类
     * @return 操作结果
     * @author JX181114 --- 郑建辉
     */
    @PutMapping("record")
    public ResultData newRecord(@Valid ExamSimulateRecordAdd object) {

        ResultData result = null;

        try {
            //根据返回的受影响条数来生成不同的返回值
            Integer row = examSimulateRecordService.insertNewData(object);

            //返回1：正常
            if (row == 1) {
                result = ResultData.success();

                //返回0：数据没有插入成功
            } else if (row == 0) {
                result = ResultData.error("插入失败，请重试");
            }
        } catch (Exception e) {
            result = ResultData.error(e.getMessage());
        }


        return result;
    }
}
