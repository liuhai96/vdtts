package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.dao.mapper.StudentMapper;
import com.lsjbc.vdtts.service.intf.StudentService;
import com.lsjbc.vdtts.pojo.vo.LayuiData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@SuppressWarnings("all")
@Service("studentService")
public class StudentServiceImp implements StudentService
{
	@Autowired
    public StudentMapper studentMapper;

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



	/*
	 *@Description:
	 *@Author:陈竑霖
	 *@Param:
	 *@return:
	 *@Date:2020/6/8 1591587038161
	 **/
	@Override
	public LayuiData selectList(Student student, int page, int pageSize) {
		int start = (page - 1) * pageSize;//计算出起始查询位置
		if(start<0){
			start=0;
		}
		List<Student> list = studentMapper.selectList(student, start, pageSize);
		int count = studentMapper.selectListCount(student);

		LayuiData layuiData = new LayuiData();
		if (list.size() > 0) {
			layuiData.setCode(0);
			layuiData.setMsg("");
			layuiData.setCount(count);
			layuiData.setData(list);
			System.out.println(student);
		} else {
			layuiData.setCode(1);
			layuiData.setMsg("查询失败");
		}
		return layuiData;
	}
}