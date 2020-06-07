package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
@Mapper
public interface TeacherMapper {
    public int findTeacherCount(@Param("tSchoolId") Integer tSchoolId);
    public ArrayList<Teacher> findTeacherList(@Param("start") int start,@Param("pageSize") int pageSize,@Param("tSchoolId") Integer tSchoolId);
}
