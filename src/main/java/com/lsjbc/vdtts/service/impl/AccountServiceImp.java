package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.AccountMapper;
import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.dao.mapper.StudentMapper;
import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.AccountService;
import com.lsjbc.vdtts.utils.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

/**
 * @author LiLang9725
 * @date 2020/6/9 1:39
 */
@Service
@Transactional
public class AccountServiceImp implements AccountService {
    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private SchoolMapper schoolMapper;
    @Autowired
    private StudentMapper studentMapper;


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
    @Override
    public ResultData UserLogin(Account account, HttpServletRequest request){
        String nextJsp = null;//下一个界面的路径
        String notify = "";//弹窗通知信息
        account = accountMapper.UserLogin(account);
        if(account != null){ //登录成功时
            switch (account.getAType()) {
                case "school": //驾校登录界面地址
                    nextJsp = "pages/staff/schoolmenu.jsp";//前端jsp地址
                    request.getSession().setAttribute("school", schoolMapper.findAccount(account));
                    break;
                case "student":
                    nextJsp = "";
                    request.getSession().setAttribute("student", studentMapper.findAccount(account));
                break;//学员登录界面地址
                case "teacher"://教练登录界面地址
                    nextJsp = "teacherController/teacherInit";//后端访问地址
                    request.getSession().setAttribute("teacher", teacherMapper.findAccount(account));
                    break;
            }
            request.getSession().setAttribute("aId", account.getAId());
            request.getSession().setAttribute("aType", account.getAType());
            notify = "恭喜你，登录成功！";
        } else {//登录失败
            nextJsp = "pages/homepage/login.jsp";
            notify = "此用户名不存在，请核对信息!";
        }
        ResultData resultData = ResultData.success(notify);
        resultData.put("url",nextJsp);
        return resultData;
    }
}
