package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.StudentMapper;
import com.lsjbc.vdtts.entity.Student;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;

/**
 * @ClassName: StudentDao
 * @Description:
 * @Datetime: 2020/6/12   14:24
 * @Author: JX181114 - 郑建辉
 */
@Repository(StudentDao.NAME)
public class StudentDao {

    /**
     * Bean名
     */
    public static final String NAME = "StudentDao";

    @Resource
    private StudentMapper mapper;

    /**
     * 根据驾校ID来拉取学员数量
     *
     * @param schoolId 驾校ID
     * @return 学员数量
     * @author JX181114 --- 郑建辉
     */
    public Integer getCountBySchoolId(Integer schoolId) {

        Example example = new Example(Student.class);

        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("sSchoolId", schoolId);

        return mapper.selectCountByExample(example);
    }
}
