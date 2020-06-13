package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.CarMapper;
import com.lsjbc.vdtts.entity.Car;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;

/**
 * @ClassName: CarDao
 * @Description:
 * @Datetime: 2020/6/12   13:32
 * @Author: JX181114 - 郑建辉
 */
@Repository(CarDao.NAME)
public class CarDao {

    /**
     * Bean名
     */
    public static final String NAME = "CarDao";

    @Resource
    private CarMapper mapper;

    /**
     * 获取指定驾校的总教练车辆数
     *
     * @param schoolId 驾校ID
     * @return 总教练车辆数
     * @author JX181114 --- 郑建辉
     */
    public Integer getCountBySchoolId(Integer schoolId) {
        Example example = new Example(Car.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("cSchoolId", schoolId);

        return mapper.selectCountByExample(example);
    }
}
