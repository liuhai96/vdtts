package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface StudentMapper {

	public List<Student> selectList(@Param("e") Student student, @Param("start") int start, @Param("pageSize") int pageSize);
	public int selectListCount(@Param("e") Student student);
    public List<Student> selectAllInfo(@Param("student") Student student, @Param("page") int page, @Param("limit") int limit);
    public int insertstudent(Student student);
    public int updatestudent(Student student);
    public int selectCount(Student student);
    public int deletestudent(Student student);
    public String registerSelect(@Param("aAccount") String aAccount);
    public int addStudentMessage(Student student);
}
