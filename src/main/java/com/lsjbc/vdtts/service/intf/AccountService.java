package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.AdminAccount;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;

import javax.servlet.http.HttpServletRequest;

public interface AccountService {
    public LayuiTableData findAccount(String account);
    public int addStudentAccount(Account account);//加入学生账号
    public Account accountRepetition(String account);//账号查重
    public Account addAccountData(Account account);//加入数据
    public ResultData UserLogin(Account account, HttpServletRequest request);//登录
    public ResultData verifyPass(Account account);//密码验证
    public ResultData updatePass(Account account);//修改密码

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/14
     **/
    public int updateaccount(Account account);
    public AdminAccount adminLogin(AdminAccount account);
}
