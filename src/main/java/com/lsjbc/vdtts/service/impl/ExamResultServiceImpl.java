package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.ExamResultMapper;
import com.lsjbc.vdtts.entity.ExamResult;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.ExamResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ExamResultServiceImpl implements ExamResultService {
    @Autowired
    private ExamResultMapper examResultMapper;
    @Override
    public LayuiTableData selectStudentExamList(int start, int pageSize,Integer sSchoolId) {
        /*
         *@Description:查询学员考试情况
         *@Author:刘海
         *@Param:[start, pageSize, sSchoolId]
         *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
         *@Date:2020/6/10 23:58
         **/

        LayuiTableData layuiTableData = new LayuiTableData();
        if(sSchoolId==null){
            layuiTableData.setCode(-1);
            layuiTableData.setMsg("未找到该驾校信息");
        }else{
            ArrayList<ExamResult> examResultList = examResultMapper.selectStudentExamList(start,pageSize,sSchoolId);
            System.out.println("examResultList>>>:"+examResultList);
            int count = examResultMapper.selectStudentExamCount(sSchoolId);
            layuiTableData.setCount(count);
            layuiTableData.setCode(0);
            layuiTableData.setData(examResultList);
        }
        return layuiTableData;
    }


    @Override
    /*
     *@Description:安排学员考试
     *@Author:刘海
     *@Param:[erId, erStudentId, examSujectId, teacherId]
     *@return:com.lsjbc.vdtts.pojo.vo.ResultData
     *@Date:2020/6/10 23:58
     **/
    public ResultData arringeExam(int erId, int erStudentId, int examSujectId, int teacherId) {
        ResultData resultData = null;
        int count = 0;
        ExamResult examResult = examResultMapper.findSubjectExamState(erId,erStudentId);
        switch (examSujectId){
            case 0:
                resultData = ResultData.error(-1,"请选择考试科目");
                break;
            case 1:
                count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                if(count>=5){
                    resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                }else{
                    int num = examResultMapper.updateStudentExanState(examSujectId,erId);
                    if(num>0){
                        resultData = ResultData.success(0,"您已成功为该学员安排科目一考试");
                    }

                }
                break;
            case 2:
                if(examResult.getErState2()==2||examResult.getErState2()==1){
                    resultData = ResultData.error(-1,"该学员的科目二已通过或正在考试中");
                }else{
                    if(examResult.getErState1()==1){
                        if(examResult.getErTime2()>280){
                            count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                            if(count>=5){
                                resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                            }else{
                                int num = examResultMapper.updateStudentExanState(examSujectId,erId);
                                if(num>0){
                                    resultData = ResultData.success(0,"您已成功为该学员安排科目二考试");
                                }
                            }
                        }else{
                            resultData = ResultData.error(-1,"该学生的学时还不够哦");
                        }
                    }else{
                        resultData = ResultData.error(-1,"该学生的科目一考试未通过，请通过后再安排考试");
                    }
                }

                break;
            case 3:
                if(examResult.getErState3()==2||examResult.getErState3()==1){
                    resultData = ResultData.error(-1,"该学员的科目三已通过或正在考试中");
                }else{
                    if(examResult.getErState2()==1){
                        if(examResult.getErTime3()>280){
                            count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                            if(count>=5){
                                resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                            }else{
                                int num = examResultMapper.updateStudentExanState(examSujectId,erId);
                                if(num>0){
                                    resultData = ResultData.success(0,"您已成功为该学员安排科目三考试");
                                }
                            }
                        }else{
                            resultData = ResultData.error(-1,"该学生的学时还不够哦");
                        }
                    }else{
                        resultData = ResultData.error(-1,"该学生的科目二考试未通过，请通过后再安排考试");
                    }
                }
                break;
            case 4:
                if(examResult.getErState4()==2||examResult.getErState4()==1){
                    resultData = ResultData.error(-1,"该学员的科目四已通过或正在考试中");
                }else{
                    if(examResult.getErState3()==1){
                        if(examResult.getErTime4()>280){
                            count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                            if(count>=5){
                                resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                            }else{
                                int num = examResultMapper.updateStudentExanState(examSujectId,erId);
                                if(num>0){
                                    resultData = ResultData.success(0,"您已成功为该学员安排科目四考试");
                                }
                            }
                        }else{
                            resultData = ResultData.error(-1,"该学生的学时还不够哦");
                        }
                    }else{
                        resultData = ResultData.error(-1,"该学生的科目三考试未通过，请通过后再安排考试");
                    }
                }
                break;
        }
        return resultData;
    }
}
