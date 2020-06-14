package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;

public interface ExamResultService {
    LayuiTableData selectStudentExamList(String page, String limit, String sName, Integer sSchoolId);

    ResultData arringeExam(int erId, int erStudentId, int examSujectId, int teacherId);

    ResultData enterResults(int erId, int studentId, int examSujectId, int erScore);
}
