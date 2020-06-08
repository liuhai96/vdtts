package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.AccountMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.service.intf.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author LiLang9725
 * @date 2020/6/8 9:11
 */
@Service
@Transactional
public class UserLoginServiceImp implements UserLoginService {
    @Autowired
    public AccountMapper accountMapper;
    @Override
    public Account UserLogin(Account account) {
        return accountMapper.UserLogin(account);
    }
}
