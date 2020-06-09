package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;

import java.util.ArrayList;

public interface TeacherService {
    public int findTeacherCount(Integer tSchoolId);
    public ArrayList<Teacher> findTeacherList(int start,int pageSize,Integer tSchoolId);
    public LayuiTableData addTeacher(Teacher teacher, Account teacherAccount);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607662706
     **/
    public LayuiTableData teacherList(Teacher teacher, int page, int pageSize);
}
