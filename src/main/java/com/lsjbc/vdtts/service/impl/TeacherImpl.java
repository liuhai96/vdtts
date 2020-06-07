package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.AccountMapper;
import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.service.intf.TeacherService;
import com.lsjbc.vdtts.tools.LayuiData;
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
    public int findTeacherCount(Integer tSchoolId) {
        return teacherMapper.findTeacherCount(tSchoolId);
    }

    @Override
    public ArrayList<Teacher> findTeacherList(int start, int pageSize, Integer tSchoolId) {
        return teacherMapper.findTeacherList(start,pageSize,tSchoolId);
    }


    @Autowired
    private AccountMapper accountMapper;
    @Override
    /*
     *@Description:
     *@Author:刘海
     *@Param:[teacher, teacherAccount]
     *@return:com.lsjbc.vdtts.tools.LayuiData
     *@Date:2020/6/7 22:55
     **/
    public LayuiData addTeacher(Teacher teacher,Account teacherAccount) {
        Account rerultAccount = accountMapper.findAccount(teacherAccount.getAAccount());
        LayuiData layuiData = new LayuiData();
        if(null==rerultAccount){
            int num = accountMapper.addAccount(teacherAccount);
            System.out.println("teacherAccount"+teacherAccount);
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
}
