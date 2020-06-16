package com.lsjbc.vdtts.api;

import com.github.pagehelper.Page;
import com.lsjbc.vdtts.constant.consist.EvaluateTypeConstant;
import com.lsjbc.vdtts.entity.Evaluate;
import com.lsjbc.vdtts.pojo.vo.LayuiFlowData;
import com.lsjbc.vdtts.service.impl.EvaluateServiceImpl;
import com.lsjbc.vdtts.service.intf.EvaluateService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @ClassName: EvaluateApi
 * @Description:
 * @Datetime: 2020/6/16   0:37
 * @Author: JX181114 - 郑建辉
 */
@CrossOrigin
@RestController
@RequestMapping("api/evaluate")
public class EvaluateApi {

    @Resource(name = EvaluateServiceImpl.NAME)
    private EvaluateService evaluateService;

    /**
     * 使用流加载获取叫教练评价
     *
     * @param id   教练ID
     * @param page 页数
     * @return 20条评价
     */
    @GetMapping("teacher/{id}")
    public LayuiFlowData<Evaluate> getTeacherEvaluatePageById(@PathVariable("id") Integer id, Integer page) {
        Page<Evaluate> pageInfo = evaluateService.getEvaluateByTypeAndId(EvaluateTypeConstant.TYPE_TEACHER, id, page);

        LayuiFlowData<Evaluate> flowData = new LayuiFlowData<>();

        flowData.setPages(pageInfo.getPages());
        flowData.setData(pageInfo.getResult());

        return flowData;
    }
}
