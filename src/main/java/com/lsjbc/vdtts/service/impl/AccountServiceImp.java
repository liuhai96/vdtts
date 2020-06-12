package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.AccountMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.AccountService;
import com.lsjbc.vdtts.utils.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author LiLang9725
 * @date 2020/6/9 1:39
 */
@Service
@Transactional
public class AccountServiceImp implements AccountService {
    @Autowired
    private AccountMapper accountMapper;
    @Override
    public LayuiTableData findAccount(String account) {
        return null;
    }
    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[account]
     *@return:int
     *@Date:2020/6/9 1:54
     **/
    public int addStudentAccount(Account account){
        return accountMapper.addAccount(account);
    }

    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[account]
     *@return:com.lsjbc.vdtts.entity.Account
     *@Date:2020/6/9 11:06
     **/
    public Account accountRepetition(String account){
        return accountMapper.findAccount(account);
    }

    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[account]
     *@return:com.lsjbc.vdtts.entity.Account
     *@Date:2020/6/12 0:14 加登录数据
     **/
    public Account addAccountData(Account account){
        Tool tool = new Tool();
        for(int i = 0;i < 5;i++){
            String aAccount = tool.getRandCode(tool.getRandom(6,11),null);//随机获取6~11位账号
            if(accountMapper.findAccount(aAccount) == null) {//随机账号查重
                account.setAAccount(aAccount);
                accountMapper.addAccount(account);//加登录数量
                break;
            }
        }
        return account;
    }
}
