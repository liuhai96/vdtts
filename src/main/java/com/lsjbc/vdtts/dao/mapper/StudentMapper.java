package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface StudentMapper {
    public List<Student> selectList(@Param("e") Student student, @Param("start") int start, @Param("pageSize") int pageSize);
    public int selectListCount(@Param("e") Student student);


}
