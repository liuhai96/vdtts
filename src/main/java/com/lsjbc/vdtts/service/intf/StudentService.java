package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface StudentService {
    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/8
     **/
    public List<Student> selectAllInfo(@Param("student") Student student, @Param("page") int page, @Param("limit") int limit);
    public int selectStudentCount(@Param("student") Student student);
    public int resetPwd(String studentId);
    public int insertstudent(Student student);
    public int updatestudent(Student student);
    public int deletestudent(Student student);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591600767377
     **/
	public LayuiTableData selectList(Student student, int page, int pageSize);





    public int registerStudent(Student student);


    /*
     *@Description:
     *@Author:刘海
     *@Param:
     *@return:
     *@Date:2020/6/15 22:56
     **/
    LayuiTableData findStudenList(HttpServletRequest request,String page,String limit,String sName);
    ResultData updateStudentApplyState(Integer sId);
    ResultData updateStudentTeacherId(Integer sTeacherId,Integer sId);

}
