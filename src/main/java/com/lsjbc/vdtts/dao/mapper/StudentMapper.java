package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface StudentMapper {
    public List<Student> selectAllInfo(@Param("student") Student student, @Param("page") int page, @Param("limit") int limit);
    public int insertstudent(Student student);
    public int updatestudent(Student student);
    public int selectCount(Student student);
    public int deletestudent(Student student);
}