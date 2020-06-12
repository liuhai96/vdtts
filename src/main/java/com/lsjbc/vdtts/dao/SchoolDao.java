package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.entity.School;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

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
}
