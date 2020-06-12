package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;

public interface ExamResultService {
    public LayuiTableData selectStudentExamList(int start, int pageSize,Integer sSchoolId);
    public ResultData arringeExam(int erId,int erStudentId,int examSujectId,int teacherId);
    public ResultData enterResults(int erId,int studentId,int examSujectId,int erScore);
}