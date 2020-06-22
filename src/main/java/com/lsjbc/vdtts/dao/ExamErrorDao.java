package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.BaseDao;
import com.lsjbc.vdtts.dao.mapper.ExamErrorMapper;
import com.lsjbc.vdtts.entity.ExamError;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName: ExamErrorDao
 * @Description:
 * @Datetime: 2020/6/9   1:10
 * @Author: JX181114 - 郑建辉
 */
@Repository(ExamErrorDao.NAME)
public class ExamErrorDao implements BaseDao<ExamError> {

    public static final String NAME = "ExamErrorDao";

    @Resource
    private ExamErrorMapper mapper;

    /**
     * 根据等级删除来删除错题记录
     *
     * @param level 科目等级
     * @return 受影响条数
     * @author JX181114 --- 郑建辉
     */
    public Integer deleteByLevel(Integer level) {
        Example example = new Example(ExamError.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("eeLevel", level);
        return mapper.deleteByExample(example);
    }

    /**
     * 根据学员来查询错题
     *
     * @param studentId 学员ID
     * @return 错题集合
     * @author JX181114 --- 郑建辉
     */
    public List<ExamError> getByStudentId(Integer studentId, Integer level) {
        Example example = new Example(ExamError.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("eeStudentId", studentId);
        criteria.andEqualTo("eeLevel", level);
        return mapper.selectByExample(example);
    }

    /**
     * 批量插入
     *
     * @param list 要插入的记录集合
     * @return 受影响条数
     * @author JX181114 --- 郑建辉
     */
    public Integer add(List<ExamError> list) {

        if (list == null || list.size() == 0) {
            return 0;
        }

        return mapper.insertList(list);
    }

    /**
     * 通过主键来获取一个对象
     *
     * @param id 主键
     * @return 对象
     */
    @Override
    public ExamError getById(Integer id) {
        return null;
    }

    /**
     * 新增对象
     * 注意
     * 调用这个方法，会自动的向对象中注入主键
     * 所以返回的不是主键，而是受影响条数
     *
     * @param object 对象
     * @return 受影响条数
     */
    @Override
    public Integer add(ExamError object) {
        return null;
    }

    /**
     * 根据ID来更新对象
     * 注意
     * 传入的obj对象中主键不得为空
     * 否则会抛出异常
     *
     * @param object 对象
     * @return 受影响条数
     */
    @Override
    public Integer updateById(ExamError object) {
        return null;
    }

    /**
     * 根据主键来删除记录
     *
     * @param id 主键
     * @return 受影响条数
     * @author JX181114 --- 郑建辉
     */
    @Override
    public Integer deleteById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }
}
