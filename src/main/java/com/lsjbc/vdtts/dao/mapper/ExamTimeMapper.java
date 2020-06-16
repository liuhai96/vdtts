package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.ExamTime;
import com.lsjbc.vdtts.utils.mopper.CustomBaseMapper;

import java.util.ArrayList;

public interface ExamTimeMapper extends CustomBaseMapper<ExamTime> {
    public ArrayList<ExamTime> findStudentExamNotes(Integer etStudentId);
}