package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.StudentMapper;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@SuppressWarnings("all")
@Service("studentService")
public class StudentServiceImpl implements StudentService
{
	@Autowired
    public StudentMapper studentMapper;
	/**
	 * student 里面所有的属性将会作为查询条件
	 * page 要查询的特定页数
	 * limit 每页条数
	 *
	 * List<Student 最终返回的查询结果
	 * @author  周永哲
	 */
	@Override
	public List<Student> selectAllInfo(Student student, int page, int limit) {
		List<Student> selectAllInfo =studentMapper.selectAllInfo(student,page,limit);
		return selectAllInfo;
	}
	/*
	 *@Description:
	 *@Author:周永哲
	 *@Param:
	 *@return:
	 *@Date:2020/6/8 15860799877
	 **/
	@Override
	public int selectCount(Student student) {
		int selectCount = studentMapper.selectCountByStudent(student);
		return selectCount;
	}

	/*
	 *@Description:
	 *@Author:周永哲
	 *@Param:
	 *@return:
	 *@Date:2020/6/8 15860799877
	 **/
	@Override
	public int resetPwd(String studentId) {
		int resetPwd = studentMapper.resetPwd(studentId);
		return resetPwd;
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
	public LayuiTableData selectList(Student student, int page, int pageSize) {
		int start = (page - 1) * pageSize;//计算出起始查询位置
		if(start<0){
			start=0;
		}
		List<Student> list = studentMapper.selectList(student, start, pageSize);
		int count = studentMapper.selectListCount(student);
        LayuiTableData layuiData = new LayuiTableData();
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

    @Override
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[student]
     *@return:int
     *@Date:2020/6/9 1:27
     **/
    public int registerStudent(Student student){
	    return studentMapper.addStudentMessage(student);
    }
}
