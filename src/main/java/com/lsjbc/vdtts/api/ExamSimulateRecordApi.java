package com.lsjbc.vdtts.api;

import com.github.pagehelper.Page;
import com.lsjbc.vdtts.entity.ExamSimulateRecord;
import com.lsjbc.vdtts.pojo.vo.ExamSimulateRecordAdd;
import com.lsjbc.vdtts.pojo.vo.PageData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.impl.ExamSimulateRecordServiceImpl;
import com.lsjbc.vdtts.service.intf.ExamSimulateRecordService;
import org.springframework.web.bind.annotation.*;

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
     * 获取用户的模拟考试成绩
     *
     * @param studentId 学员ID
     * @param level     科目等级
     * @param pageIndex 指定页数
     * @return 每页10条的用户模拟考试成绩
     * @author JX181114 --- 郑建辉
     */
    @GetMapping("record/{studentId}/{level}/{page}")
    public PageData<ExamSimulateRecord> getStudentSimulateScore(@PathVariable("studentId") Integer studentId, @PathVariable("level") Integer level, @PathVariable("page") Integer pageIndex) {
        PageData<ExamSimulateRecord> pageData = new PageData<>();

        try {
            Page<ExamSimulateRecord> page = examSimulateRecordService.getRecordByIdLevelAndPageIndex(studentId, level, pageIndex);

            pageData.setCode(0);
            pageData.setCount(page.getTotal());
            pageData.setPages(page.getPages());
            pageData.setData(page.getResult());
        } catch (Exception e){
            pageData.setCode(-1);
            pageData.setMsg(e.getMessage());
        }

        return pageData;
    }

    /**
     * 用户新增模拟考试记录
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
