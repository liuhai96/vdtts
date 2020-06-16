package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.ExamResultMapper;
import com.lsjbc.vdtts.entity.ExamResult;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.ExamResultService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Service(ExamResultServiceImpl.NAME)
public class ExamResultServiceImpl implements ExamResultService {

    /**
     * Bean名
     */
    public static final String NAME = "ExamResultService";

    @Resource
    private ExamResultMapper examResultMapper;

    @Override
    public LayuiTableData selectStudentExamList(String page, String limit, String sName, HttpServletRequest request) {
        int pageSize = Integer.parseInt(limit);
        int start = (Integer.parseInt(page)-1)*pageSize;//计算从数据库第几条开始查
        LayuiTableData layuiTableData = new LayuiTableData();
        School school = (School) request.getSession().getAttribute("school");
        if(school==null){
            layuiTableData.setCode(-1);
            layuiTableData.setMsg("未找到该驾校信息");
        }else{
            ArrayList<ExamResult> examResultList = examResultMapper.selectStudentExamList(start,pageSize,sName,school.getSId());
            System.out.println("examResultList>>>:"+examResultList);
            int count = examResultMapper.selectStudentExamCount(sName,school.getSId());
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
        Integer erState = 2;
        int count = 0;
        ExamResult examResult = examResultMapper.findSubjectExamState(erId,erStudentId);
        switch (examSujectId){
            case 0:
                resultData = ResultData.error(-1,"请选择考试科目");
                break;
            case 1:
                count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                if(examResult.getErState1()==1){
                    resultData = ResultData.error(-1,"该学员的科目一已通过");
                }else if(examResult.getErState1()==2){
                    resultData = ResultData.error(-1,"该学员的科目一已通过或正在考试中");
                } else{
                    if(count>=5){
                        resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                    }else{
                        int num = examResultMapper.updateStudentExanState(examSujectId,erId,erState);
                        if(num>0){
                            resultData = ResultData.success(0,"您已成功为该学员安排科目一考试");
                        }

                    }
                }
                break;
            case 2:
                if(examResult.getErState2()==2){
                    resultData = ResultData.error(-1,"该学员的科目二或正在考试中");
                }else if(examResult.getErState2()==1){
                    resultData = ResultData.error(-1,"该学员的科目二已通过");
                }else{
                    if(examResult.getErState1()==1){
                        if(examResult.getErTime2()>280){
                            count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                            if(count>=5){
                                resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                            }else{
                                int num = examResultMapper.updateStudentExanState(examSujectId,erId,erState);
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
                if(examResult.getErState3()==2){
                    resultData = ResultData.error(-1,"该学员的科目三正在考试中");
                }else if(examResult.getErState3()==1){
                    resultData = ResultData.error(-1,"该学员的科目三已通过");
                }else{
                    if(examResult.getErState2()==1){
                        if(examResult.getErTime3()>280){
                            count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                            if(count>=5){
                                resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                            }else{
                                int num = examResultMapper.updateStudentExanState(examSujectId,erId,erState);
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
                if(examResult.getErState4()==2){
                    resultData = ResultData.error(-1,"该学员的科目四正在考试中");
                }else if(examResult.getErState4()==1){
                    resultData = ResultData.error(-1,"该学员的科目四已通过");
                }else{
                    if(examResult.getErState3()==1){
                            count = examResultMapper.findSubjectExamCount(teacherId,examSujectId);
                            if(count>=5){
                                resultData = ResultData.error(-1,"该科目考试人数已满请重新选择考试科目");
                            }else{
                                int num = examResultMapper.updateStudentExanState(examSujectId,erId,erState);
                                if(num>0){
                                    resultData = ResultData.success(0,"您已成功为该学员安排科目四考试");
                                }
                            }
                    }else{
                        resultData = ResultData.error(-1,"该学生的科目三考试未通过，请通过后再安排考试");
                    }
                }
                break;
        }
        return resultData;
    }

    @Override
    public ResultData enterResults(int erId, int studentId, int examSujectId, int erScore) {
        ResultData resultData = null;
        ExamResult examResult = examResultMapper.findSubjectExamState(erId,studentId);
        int erState = 1;
        switch (examSujectId) {
            case 0:
                resultData = ResultData.error(-1, "请选择考试科目");
                break;
            case 1:
                if (examResult.getErScore1() >= 90 && examResult.getErState1() == 1) {
                    resultData = ResultData.error(-1, "该学员的科目一已经考试通过，不能重复录入成绩");
                } else {
                    if (erScore >= 90) {
                        int num = examResultMapper.updateStudentExanState(examSujectId, erId, erState);
                        int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                        if (num > 0 && num1 > 0) {
                            resultData = ResultData.error(0, "您已成功录入该学员的科目一成绩,该学员已通过考试");
                        }
                    } else {
                        int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                        resultData = ResultData.error(0, "您已成功录入该学员的科目一成绩,该学员未通过考试");
                    }
                }
                break;
            case 2:
                if (examResult.getErScore1() > 90) {
                    if (examResult.getErScore2() >= 80 && examResult.getErState2() == 1) {
                        resultData = ResultData.error(-1, "该学员的科目二已经考试通过，不能重复录入成绩");
                    } else {
                        if (erScore >= 90) {
                            int num = examResultMapper.updateStudentExanState(examSujectId, erId, erState);
                            int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                            if (num > 0 && num1 > 0) {
                                resultData = ResultData.error(0, "您已成功录入该学员的科目二成绩,该学员已通过考试");
                            }
                        } else {
                            int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                            resultData = ResultData.error(0, "您已成功录入该学员的科目二成绩,该学员未通过考试");
                        }
                    }
                }else{
                    resultData = ResultData.error(-1,"该学员的科目一考试未通过，不能录入科目二成绩");
                }
                break;
            case 3:
                if(examResult.getErScore2()>80){
                    if(examResult.getErScore3()>=90&&examResult.getErState3()==1){
                        resultData = ResultData.error(-1,"该学员的科目三已经考试通过，不能重复录入成绩");
                    }else{
                        if (erScore >= 90) {
                            int num = examResultMapper.updateStudentExanState(examSujectId, erId, erState);
                            int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                            if (num > 0 && num1 > 0) {
                                resultData = ResultData.error(0, "您已成功录入该学员的科目三成绩,该学员已通过考试");
                            }
                        } else {
                            int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                            resultData = ResultData.error(0, "您已成功录入该学员的科目三成绩,该学员未通过考试");
                        }
                    }
                } else {
                    resultData = ResultData.error(-1, "该学员的科目二考试未通过，不能录入科目三成绩");
                }
                break;
            case 4:
                if (examResult.getErScore3() > 90) {
                    if (examResult.getErScore4() >= 90 && examResult.getErState4() == 1) {
                        resultData = ResultData.error(-1, "该学员的科目四已经考试通过，不能重复录入成绩");
                    } else {
                        if (erScore >= 90) {
                            int num = examResultMapper.updateStudentExanState(examSujectId, erId, erState);
                            int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                            if (num > 0 && num1 > 0) {
                                resultData = ResultData.error(0, "您已成功录入该学员的科目四成绩,该学员已通过考试");
                            }
                        } else {
                            int num1 = examResultMapper.updateStudentScore(erId, erScore, examSujectId);
                            resultData = ResultData.error(0, "您已成功录入该学员的科目四成绩,该学员未通过考试");
                        }
                    }
                } else {
                    resultData = ResultData.error(-1, "该学员的科目三考试未通过，不能录入科目四成绩");
                }
                break;

        }
        return resultData;
    }
}
