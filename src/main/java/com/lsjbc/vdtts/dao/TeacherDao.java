package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * @ClassName: TeacherDao
 * @Description:
 * @Datetime: 2020/6/12   14:15
 * @Author: JX181114 - 郑建辉
 */
@Repository(TeacherDao.NAME)
public class TeacherDao {

    /**
     * Bean名
     */
    public static final String NAME = "TeacherDao";

    @Resource
    private TeacherMapper mapper;

    /**
     * 查询出该驾校下所拥有的教练数字
     *
     * @param schoolId 驾校ID
     * @return 教练数量
     * @author JX181114 --- 郑建辉
     */
    public Integer getCountBySchoolId(Integer schoolId) {
//        Example example = new Example(Teacher.class);
//
//        Example.Criteria criteria = example.createCriteria();
//
//        criteria.andEqualTo("tSchoolId", schoolId);
//
//        return mapper.selectCountByExample(example);
        return null;
    }
}
