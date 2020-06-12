package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.utils.mopper.CustomBaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface TeacherMapper extends CustomBaseMapper<Teacher> {
    public int findTeacherCount(@Param("tSchoolId") Integer tSchoolId);

    public ArrayList<Teacher> findTeacherList(@Param("start") int start, @Param("pageSize") int pageSize, @Param("tSchoolId") Integer tSchoolId);

    public int addTeacher(Teacher teacher);

    public Teacher findAccountId(@Param("tId") int tId);

    public int deleteTeacher(@Param("tId") int tId);

    public int updateTeacherInfo(Teacher teacher);

    public ArrayList<Teacher> findTeacher(@Param("tSchoolId") int tSchoolId);

    public int updateTeacherApplyState(int tId);

    public int updateTeacherAccountLockState(int tId);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607995566
     **/
    public int teacherlistcount(@Param("e") Teacher teacher);
    public List<Teacher> teacherlist(@Param("e") Teacher teacher, @Param("start") int start, @Param("pageSize") int pageSize);
}
