package com.lsjbc.vdtts.api;

import com.github.pagehelper.Page;
import com.lsjbc.vdtts.constant.EvaluateType;
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
        return getEvaluatePageById(id, EvaluateType.TYPE_TEACHER, page);
    }

    /**
     * 使用流加载获取叫教练评价
     *
     * @param id   教练ID
     * @param page 页数
     * @return 20条评价
     */
    @GetMapping("school/{id}")
    public LayuiFlowData<Evaluate> getSchoolEvaluatePageById(@PathVariable("id") Integer id, Integer page) {
        return getEvaluatePageById(id, EvaluateType.TYPE_SCHOOL, page);
    }

    /**
     * 使用流加载获取评价
     *
     * @param id   教练ID/驾校ID
     * @param type 驾校或者教练
     * @param page 页数
     * @return 20条评价
     */
    public LayuiFlowData<Evaluate> getEvaluatePageById(Integer id, String type, Integer page) {
        Page<Evaluate> pageInfo = evaluateService.getEvaluateByTypeAndId(type, id, page);

        LayuiFlowData<Evaluate> flowData = new LayuiFlowData<>();

        flowData.setPages(pageInfo.getPages());
        flowData.setData(pageInfo.getResult());

        return flowData;
    }
}
