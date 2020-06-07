package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface TeacherService {
    public int findTeacherCount(Integer tSchoolId);
    public ArrayList<Teacher> findTeacherList(int start,int pageSize,Integer tSchoolId);
}
