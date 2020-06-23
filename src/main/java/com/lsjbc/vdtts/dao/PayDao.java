package com.lsjbc.vdtts.dao;

import com.lsjbc.vdtts.dao.mapper.PayMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.PayFee;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * @ClassName: PayDao
 * @Description:
 * @Datetime: 2020/6/23
 * @Author: 周永哲
 */
@Repository(PayDao.NAME)
public class PayDao {
    /**
     * Bean名
     */
    public static final String NAME = "PayDao";
    @Resource
    private PayMapper mapper;
    /**
     * 永哲
     * @param payFee
     * @return
     */
    public Integer add(PayFee payFee) {//添加账号
        return mapper.addPayFee(payFee);
    }
}
