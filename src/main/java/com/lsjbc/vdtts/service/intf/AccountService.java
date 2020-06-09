package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;

public interface AccountService {
    public LayuiTableData findAccount(String account);
    public int addStudentAccount(Account account);
    public Account accountRepetition(String account);
}
