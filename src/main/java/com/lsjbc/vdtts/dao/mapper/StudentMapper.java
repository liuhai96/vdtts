package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface StudentMapper {
/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591604044696
 **/
	public List<Student> selectList(@Param("e") Student student, @Param("start") int start, @Param("pageSize") int pageSize);
	public int selectListCount(@Param("e") Student student);


    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/9 15860799877
     **/
    public List<Student> selectAllInfo(@Param("student") Student student, @Param("page") int page, @Param("limit") int limit);
    public int selectCount(@Param("student") Student student);
    public int resetPwd(String studentId);
    public int insertstudent(Student student);
    public int updatestudent(Student student);
    public int deletestudent(Student student);
    public int addStudentMessage(Student student);


}
