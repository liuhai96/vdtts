package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.StudentMapper;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiData;
import com.lsjbc.vdtts.service.intf.StudentService;
import com.lsjbc.vdtts.pojo.vo.LayuiData;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("studentService")
public class StudentImpl implements StudentService {
	private LayuiData layuiData;
    @Resource
    private StudentMapper studentMapper;

    @Override
    public List<Student> selectAllInfo(Student student, int page, int limit) {
        List<Student> selectAllInfo =studentMapper.selectAllInfo(student,page,limit);
        return selectAllInfo;
    }

    @Override
    public int insertstudent(Student student) {
        int inserttudent = studentMapper.insertstudent(student);
        return inserttudent;
    }

    @Override
    public int updatestudent(Student student) {
        int updatestudent = studentMapper.updatestudent(student);
        return updatestudent;
    }

    @Override
    public int selectCount(Student student) {
        int selectCount = studentMapper.selectCount(student);
        return selectCount;
    }

    @Override
    public int deletestudent(Student student) {
        int deletestudent = studentMapper.deletestudent(student);
        return deletestudent;
    }

    @Override
    public LayuiData selectList(Student student, int page, int pageSize)
    {
//	    LayuiData selectList= studentMapper.selectList(student,page,pageSize);
        return layuiData;
    }


}
