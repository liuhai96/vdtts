package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.AccountMapper;
import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
@Service
@Transactional
public class TeacherImpl implements TeacherService {
    @Resource
    private TeacherMapper teacherMapper;


    @Override
    /*
     *@Description:查询各个驾校的教练基本信息
     *@Author:刘海
     *@Param:[start, pageSize, tSchoolId]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/8 19:02
     **/
    public LayuiTableData findTeacherList(int start, int pageSize, Integer tSchoolId) {
        ArrayList<Teacher> teacherList = teacherMapper.findTeacherList(start,pageSize,tSchoolId);
        System.out.println("teacherList>>>>>>"+teacherList);
        int teachCount = teacherMapper.findTeacherCount(tSchoolId);
        LayuiTableData layuiData = new LayuiTableData();
        layuiData.setCode(0);
        layuiData.setMsg("查询成功");
        layuiData.setCount(teachCount);
        layuiData.setData(teacherList);
        return layuiData;//返回前端所需要的数据类型
    }


    @Autowired
    private AccountMapper accountMapper;
    @Override
    /*
     *@Description:
     *@Author:刘海
     *@Param:[teacher, teacherAccount]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiData
     *@Date:2020/6/7 22:55
     **/
    public LayuiTableData addTeacher(Teacher teacher, Account teacherAccount) {
        Account rerultAccount = accountMapper.findAccount(teacherAccount.getAAccount());
        LayuiTableData layuiData = new LayuiTableData();
        if(null==rerultAccount){
            teacherAccount.setAType("teacher");
            int num = accountMapper.addAccount(teacherAccount);
            teacher.setTAccountId(teacherAccount.getAId());
            int num1 = teacherMapper.addTeacher(teacher);
            if(num>0&&num1>0){
                layuiData.setCode(1);
            }else{
                layuiData.setCode(2);
            }
        }else{
            layuiData.setCode(0);
        }
        return layuiData;
    }

    /*
     *@Description:
     *@Author:刘海
     *@Param:[teacher]
     *@return:
     *@Date:2020/6/8 16:15
     **/

    @Override
    public LayuiTableData deleteTeacher(int tId) {
        LayuiTableData layuiTableData = new LayuiTableData();
        Teacher teacher = teacherMapper.findAccountId(tId);
        if(null!=teacher.getTAccountId()){
            int num = teacherMapper.deleteTeacher(tId);
            int num1 = accountMapper.deleteAccount(teacher.getTAccountId());
            if(num>0&&num1>0){
                layuiTableData.setCode(1);
            }else{
                layuiTableData.setCode(0);
            }
        }else{
            layuiTableData.setCode(2);
        }

        return layuiTableData;
    }

    @Override
    public LayuiTableData updateTeacherInfo(Teacher teacher) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int num = teacherMapper.updateTeacherInfo(teacher);
        if(num>0){
            layuiTableData.setCode(1);
        }
        return layuiTableData;
    }
}
