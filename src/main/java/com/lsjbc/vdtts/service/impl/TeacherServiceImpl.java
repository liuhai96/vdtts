package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.AccountMapper;
import com.lsjbc.vdtts.dao.mapper.StudentMapper;
import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.TeacherService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {
    @Resource
    private TeacherMapper teacherMapper;
    @Resource
    private StudentMapper studentMapper;
    @Override
    /*
     *@Description:查询各个驾校的教练基本信息
     *@Author:刘海
     *@Param:[start, pageSize, tSchoolId]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/8 19:02
     **/
    public LayuiTableData findTeacherList(String page, String limit,String tName, HttpServletRequest request) {


        int pageSize = Integer.parseInt(limit);
        int start = (Integer.parseInt(page)-1)*pageSize;//计算从数据库第几条开始查
        School school = (School) request .getSession().getAttribute("school");
        ArrayList<Teacher> teacherList = teacherMapper.findTeacherList(start,pageSize,tName,school.getSId());
        int teachCount = teacherMapper.findTeacherCount(tName,school.getSId());
        LayuiTableData LayuiTableData = new LayuiTableData();
        LayuiTableData.setCode(0);
        LayuiTableData.setMsg("查询成功");
        LayuiTableData.setCount(teachCount);
        LayuiTableData.setData(teacherList);
        return LayuiTableData;//返回前端所需要的数据类型
    }


    @Resource
    private AccountMapper accountMapper;
    @Override
    /*
     *@Description:
     *@Author:刘海
     *@Param:[teacher, teacherAccount]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/7 22:55
     **/
    public LayuiTableData addTeacher(Teacher teacher, Account teacherAccount) {
        Account rerultAccount = accountMapper.findAccount(teacherAccount.getAAccount());
        LayuiTableData LayuiTableData = new LayuiTableData();
        if(null==rerultAccount){
            teacherAccount.setAType("teacher");
            int num = accountMapper.addAccount(teacherAccount);
            teacher.setTAccountId(teacherAccount.getAId());
            int num1 = teacherMapper.addTeacher(teacher);
            if(num>0&&num1>0){
                LayuiTableData.setCode(1);
            }else{
                LayuiTableData.setCode(2);
            }
        }else{
            LayuiTableData.setCode(0);
        }
        return LayuiTableData;
    }
    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591587038161
     **/
    @Override
    public LayuiTableData teacherList(Teacher teacher, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0){
            start=0;
        }
        List<Teacher> list = teacherMapper.teacherlist(teacher, start, pageSize);
        int count = teacherMapper.teacherlistcount(teacher);

        LayuiTableData layuiTableData = new LayuiTableData();
        if (list.size() > 0) {
            layuiTableData.setCode(0);
            layuiTableData.setMsg("");
            layuiTableData.setCount(count);
            layuiTableData.setData(list);
            System.out.println(teacher);
        } else {
            layuiTableData.setCode(1);
            layuiTableData.setMsg("查询失败");
        }
        return layuiTableData;
    }


    /*
     *@Description:
     *@Author:刘海
     *@Param:[teacher]
     *@return:
     *@Date:2020/6/8 16:15
     **/

    @Override
    public LayuiTableData deleteTeacher(int tId, HttpServletRequest request) {
        LayuiTableData layuiTableData = new LayuiTableData();
        School school = (School) request .getSession().getAttribute("school");
        Teacher teacher = teacherMapper.findAccountId(tId);
        if(null!=teacher.getTAccountId()){
            int num = teacherMapper.deleteTeacher(tId);
            int num1 = accountMapper.deleteAccount(teacher.getTAccountId());
            int num2 = studentMapper.updateTeacherId(school.getSId());
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
    /*
     *@Description:修改教练基本信息
     *@Author:刘海
     *@Param:[teacher]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/9 15:26
     **/
    public LayuiTableData updateTeacherInfo(Teacher teacher) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int num = teacherMapper.updateTeacherInfo(teacher);
        if(num>0){
            layuiTableData.setCode(1);
        }
        return layuiTableData;
    }

    @Override
    /*
     *@Description:
     *@Author:刘海
     *@Param:[tSchoolId]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/9 15:27
     **/

    public LayuiTableData findTeacher(int tSchoolId) {
        LayuiTableData layuiTableData = new LayuiTableData();
        ArrayList<Teacher> teacherList = teacherMapper.findTeacher(tSchoolId);
        layuiTableData.setData(teacherList);
        return layuiTableData;
    }

    @Override
    /*
     *@Description:
     *@Author:刘海
     *@Param:[cId]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/9 21:39
     **/
    public LayuiTableData updateTeacherApplyState(int tId) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int num = teacherMapper.updateTeacherApplyState(tId);
        if(num>0){
            layuiTableData.setCode(1);
        }else{
            layuiTableData.setCode(0);
        }
        return layuiTableData;
    }

    @Override
    /*
     *@Description:
     *@Author:刘海
     *@Param:[tId]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/9 22:25
     **/
    public LayuiTableData updateTeacherAccountLockState(int tId) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int num = teacherMapper.updateTeacherAccountLockState(tId);
        if(num>0){
            layuiTableData.setCode(1);
        }else{
            layuiTableData.setCode(0);
        }
        return layuiTableData;
    }

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/11
     **/
    @Override
    public List<Teacher> selectAllInfo(Teacher teacher, int page, int limit) {
        List<Teacher> selectAllInfo = teacherMapper.selectAllInfo(teacher,page,limit);
        return selectAllInfo;
    }

    @Override
    public int selectTeacherCount(Teacher teacher) {
        int selectCount = teacherMapper.selectTeacherCount(teacher);
        return selectCount;
    }
    @Override
    public ResultData UpdatePhone(Teacher teacher){
        if(teacherMapper.teacherUpdate(teacher) > 0)
            return ResultData.success("修改成功！");
        else return ResultData.success("修改失败！");
    }
}
