package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.ExamTime;

import java.util.ArrayList;

public interface ExamTimeMapper {
    public ArrayList<ExamTime> findStudentExamNotes(Integer etStudentId);
}

