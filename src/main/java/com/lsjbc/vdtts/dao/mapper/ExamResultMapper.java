package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.ExamResult;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface ExamResultMapper {
    /*
     *@Description:
     *@Author:刘海
     *@Param:
     *@return:
     *@Date:2020/6/10 23:59
     **/
    public ArrayList<ExamResult> selectStudentExamList( @Param("start") int start, @Param("pageSize") int pageSize,@Param("sSchoolId") Integer sSchoolId);
    public int selectStudentExamCount(Integer sSchoolId);
    public ExamResult findSubjectExamState(@Param("erId") Integer erId,@Param("erStudentId") Integer erStudentId);
    public int findSubjectExamCount (@Param("tId") Integer tId,@Param("examSujectId") Integer examSujectId);
    public int updateStudentExanState(@Param("examSujectId") Integer examSujectId,@Param("erId") Integer erId,@Param("erState") Integer erState);
    public int updateStudentScore(@Param("erId") Integer erId,@Param("erScore") Integer erScore,@Param("examSujectId") Integer examSujectId);
    //结束
}
