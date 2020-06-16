package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.TransManageDao;
import com.lsjbc.vdtts.dao.mapper.*;
import com.lsjbc.vdtts.entity.*;
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
    @Autowired
    private EvaluateMapper evaluateMapper;
    @Autowired
    private TransManageDao transManageDao;


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
        Tool tool = new Tool();
        String notify = "";//弹窗通知信息
        ResultData resultData = null;
        account.setAPassword(tool.createMd5(account.getAPassword()));
        account = accountMapper.UserLogin(account);
        if(account != null){ //登录成功时
            switch (account.getAType()) {
                case "school": //驾校登录界面地址
                    School school = schoolMapper.findAccount(account);
                    if(school.getSLock()=="true"){
                        resultData = ResultData.error(-1,"驾校已被锁定登录");
                    }else{
                        request.getSession().setAttribute("school", school);
                    }
                    break;
                case "student":
                    request.getSession().setAttribute("student", studentMapper.findAccount(account));
                break;//学员登录界面地址
                case "teacher"://教练登录界面地址
                    //教练的对象
                    Teacher teacher = teacherMapper.findAccount(account);
                    if(teacher.getTLock()=="true"){
                        resultData = ResultData.error(-1,"您的账号已被锁定，请找驾校询问具体原因");
                    }else{
                        request.getSession().setAttribute("teacher", teacher);
                        resultData = ResultData.success(1,"登录成功");
                    }
                    //教练评价
                    Evaluate evaluate = new Evaluate();
                    evaluate.setEToId(teacher.getTId());
                    evaluate.setEType("teacher");
                    request.getSession().setAttribute("evaluate", evaluateMapper.selectEvaluate(evaluate));
                    break;
                case "manage":
                    TransManage transManage = transManageDao.findTransManage(account);
                    if(transManage!=null){
                        request.getSession().setAttribute("manage",transManage);
                        resultData = ResultData.success(1,"登录成功");
                    }else{
                        resultData = ResultData.error(-1,"未找到该运管信息");
                    }
            }
        } else {//登录失败
            resultData = ResultData.error(-2,"登录失败，请核对账号");
        }
        nextJsp = "pages/backhomepage/index.jsp";//前端jsp地址
        resultData= ResultData.success("url",nextJsp);
        return resultData;
    }

    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[account] 密码验证
     *@return:com.lsjbc.vdtts.pojo.vo.ResultData
     *@Date:2020/6/13 14:34
     **/
    public ResultData verifyPass(Account account){
        account = accountMapper.selectAccount(account);
        if(account != null) return ResultData.success("true");
        else return ResultData.success("false");
    }

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/11
     **/
    @Override
    public ResultData updatePass(Account account){
        if(accountMapper.updateAccount(account) > 0)
            return ResultData.success("true");
        else return ResultData.success("false");
    }

    @Override
    public int updateaccount(Account account) {
        int updateaccount = accountMapper.updateaccount(account);
        return updateaccount;
    }
    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/14
     **/
    @Override
    public AdminAccount adminLogin(AdminAccount account) {
        AdminAccount adminLogin = accountMapper.adminLogin(account);
        return adminLogin;
    }
}
