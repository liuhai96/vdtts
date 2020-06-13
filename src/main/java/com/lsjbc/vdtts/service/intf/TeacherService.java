package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherService {
    public LayuiTableData findTeacherList(int start,int pageSize,Integer tSchoolId);
    public LayuiTableData addTeacher(Teacher teacher, Account teacherAccount);
    public LayuiTableData deleteTeacher(int tId);
    public LayuiTableData updateTeacherInfo(Teacher teacher);
    public LayuiTableData findTeacher( int tSchoolId);
    public LayuiTableData updateTeacherApplyState(int tId);
    public LayuiTableData updateTeacherAccountLockState(int tId);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607662706
     **/
    public LayuiTableData teacherList(Teacher teacher, int page, int pageSize);

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/11
     **/
    public List<Teacher> selectAllInfo(@Param("teacher") Teacher teacher, @Param("page") int page, @Param("limit") int limit);
    public int selectTeacherCount(@Param("teacher") Teacher teacher);
}
