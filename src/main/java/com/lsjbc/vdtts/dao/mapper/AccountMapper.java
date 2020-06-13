package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Account;
import org.apache.ibatis.annotations.Param;

public interface AccountMapper {

    public Account findAccount(@Param("aAccount") String aAccount);
    public int addAccount(Account account);
    public Account UserLogin(Account account);
    public int deleteAccount(@Param("aId") int aId);

    public int updateaccount(Account account);

}
