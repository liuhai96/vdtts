package com.lsjbc.vdtts.dao.mopper;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * @ClassName: CustomBaseMapper
 * @Description: 这是一个通用Mapper接口，通用Mapper接口只支持单表查询
 * 多表查询请不要继承这个接口
 * 多表查询请不要继承这个接口
 * 多表查询请不要继承这个接口
 * @Datetime: 2020/6/6   13:02
 * @Author: JX181114 - 郑建辉
 */
public interface CustomBaseMapper<T> extends Mapper, MySqlMapper<T> {

    /**
     * 通过主键来获取一个对象
     *
     * @param id 主键
     * @return 对象
     */
    T getById(Integer id);

    /**
     * 新增对象
     * 注意
     * 调用这个方法，会自动的向对象中注入主键
     * 所以返回的不是主键，而是受影响条数
     *
     * @param object 对象
     * @return 受影响条数
     */
    Integer add(T object);

    /**
     * 根据ID来更新对象
     * 注意
     * 传入的obj对象中主键不得为空
     * 否则会抛出异常
     *
     * @param object 对象
     * @return 受影响条数
     */
    T updateById(T object);

    /**
     * 根据主键来删除记录
     *
     * @param id 主键
     * @return 受影响条数
     */
    Integer deleteById(Integer id);


}
