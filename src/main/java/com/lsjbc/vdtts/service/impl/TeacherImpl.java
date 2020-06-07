package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import com.lsjbc.vdtts.entity.Teacher;
import com.lsjbc.vdtts.service.intf.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
@Service
public class TeacherImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public int findTeacherCount(Integer tSchoolId) {
        return teacherMapper.findTeacherCount(tSchoolId);
    }

    @Override
    public ArrayList<Teacher> findTeacherList(int start, int pageSize, Integer tSchoolId) {
        return teacherMapper.findTeacherList(start,pageSize,tSchoolId);
    }
}
