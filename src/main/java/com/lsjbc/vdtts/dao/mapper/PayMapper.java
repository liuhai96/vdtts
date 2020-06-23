package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.PayFee;
import com.lsjbc.vdtts.utils.mopper.CustomBaseMapper;

public interface PayMapper extends CustomBaseMapper<PayFee> {

    public int addPayFee(PayFee payFee);
}
