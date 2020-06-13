package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;

import javax.servlet.http.HttpServletRequest;

public interface AccountService {
    public LayuiTableData findAccount(String account);
    public int addStudentAccount(Account account);
    public Account accountRepetition(String account);
    public Account addAccountData(Account account);
    public ResultData UserLogin(Account account, HttpServletRequest request);
}
