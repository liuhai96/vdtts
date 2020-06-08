package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiData;

public interface  StudentService
{
	public LayuiData selectList(Student student, int page, int pageSize);
}
