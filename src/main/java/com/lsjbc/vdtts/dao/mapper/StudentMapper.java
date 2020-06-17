package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.utils.mopper.CustomBaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StudentMapper extends CustomBaseMapper<Student> {
    /*
     *@Description:学生表查询
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591604044696
     **/
    List<Student> selectList(@Param("e") Student student, @Param("start") int start, @Param("pageSize") int pageSize);

    int selectListCount(@Param("e") Student student);

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/9 15860799877
     **/
    List<Student> selectAllInfo(@Param("student") Student student, @Param("page") int page, @Param("limit") int limit);

    int selectStudentCount(@Param("student") Student student);

    int resetPwd(String studentId);

    int insertstudent(Student student);

    int updatestudent(Student student);

    int deletestudent(Student student);

    int addStudentMessage(Student student);

    //	//sfz
    //	public int apply(@Param("sSfz") int sSfz);
    public Student insSfz(Student student);
    public Student findsfz(Student student);
    public int inschool(Student student);

    public Student findAccount(Account account);

    /*
     *@Description:
     *@Author:刘海
     *@Param:
     *@return:
     *@Date:2020/6/15 22:55
     **/
    public int updateTeacherId(@Param("sSchoolId") Integer sSchoolId,@Param("sTeacherId") Integer sTeacherId);
    List<Student> findStudenList(@Param("sSchoolId") Integer sSchoolId, @Param("start") int start, @Param("pageSize") int pageSize,@Param("sName") String sName);
    int findStudentCount(@Param("sSchoolId") Integer sSchoolId,@Param("sName") String sName);
    int updateApplyState(Integer sId);
    int updateStudentTeacherId(@Param("sTeacherId") Integer sTeacherId,@Param("sId") Integer sId);
    Student findTeacher(Integer sId);


}
