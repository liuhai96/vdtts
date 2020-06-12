package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.EvaluateMapper;
import com.lsjbc.vdtts.entity.Evaluate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @ClassName: EvaluateDao
 * @Description:
 * @Datetime: 2020/6/12   11:28
 * @Author: JX181114 - 郑建辉
 */
@Repository(value = EvaluateDao.NAME)
@Slf4j
public class EvaluateDao {

    /**
     * Bean名
     */
    public static final String NAME = "EvaluateDao";

    @Resource
    private EvaluateMapper mapper;

    /**
     * 获取特定驾校/教练的平均推荐指数
     *
     * @param type 驾校/教练类型
     * @param id   驾校ID/教练ID
     * @return 平均推荐等级
     * @author JX181114 --- 郑建辉
     */
    public Double getAvgByTypeAndId(String type, Integer id) {

        //先获取出所有的记录
        Example example = new Example(Evaluate.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("eType", type);
        criteria.andEqualTo("eToId", id);

        //获取出所有查询出来的记录
        List<Evaluate> evaluates = mapper.selectByExample(example);

        //如果没有记录，直接返回0
        if (evaluates.size() == 0) {
            return Double.valueOf(0);
        }

        //如果只有一条记录，直接返回该记录的评分
        if (evaluates.size() == 1) {
            return Double.valueOf(evaluates.get(0).getEScore());
        }

        AtomicReference<Float> sum = new AtomicReference<>(0f);

        //开始计算所有的分数综合
        evaluates.forEach(item -> {
            sum.updateAndGet(v -> v + item.getEScore());
        });

        //计算平均分
        Double avg = sum.get() * 1.0 / evaluates.size();

        return avg;
    }
}
