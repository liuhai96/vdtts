package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.entity.School;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName: SchoolDao
 * @Description:
 * @Datetime: 2020/6/12   11:53
 * @Author: JX181114 - 郑建辉
 */
@Repository(SchoolDao.NAME)
public class SchoolDao {

    /**
     * Bean名
     */
    public static final String NAME = "SchoolDao";

    @Resource
    private SchoolMapper mapper;

    /**
     * 根据主键来获取信息
     *
     * @param id 主键
     * @return 驾校信息
     * @author JX181114 --- 郑建辉
     */
    public School getById(Integer id) {
        return (School) mapper.selectByPrimaryKey(id);
    }

    /**
     * 根据驾校名称来进行模糊查询驾校信息
     *
     * @param name 驾校名称
     * @return 驾校集合
     */
    public List<School> getByNameLike(String name) {
        Example example = new Example(School.class);

        Example.Criteria criteria = example.createCriteria();

        criteria.andLike("sName", "%" + name + "%");

        return mapper.selectByExample(example);
    }
}
