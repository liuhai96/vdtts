package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.ExamTimeMapper;
import com.lsjbc.vdtts.entity.ExamTime;
import com.lsjbc.vdtts.service.intf.ExamTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ExamTimeServiceImpl implements ExamTimeService {
    @Autowired
    private ExamTimeMapper examTimeMapper;

    @Override
    public ArrayList<ExamTime> findStudentExamNotes() {
        return examTimeMapper.findStudentExamNotes(1);
    }
}
