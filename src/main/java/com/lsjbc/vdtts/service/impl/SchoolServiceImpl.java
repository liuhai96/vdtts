package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("all")
@Service("schoolService")
public class SchoolServiceImpl implements SchoolService
{
	@Autowired
    public SchoolMapper schoolMapper;

	/*
	 *@Description:
	 *@Author:陈竑霖
	 *@Param:
	 *@return:
	 *@Date:2020/6/8 1591587038161
	 **/
	@Override
	public LayuiTableData schoolList(School school, int page, int pageSize)
	{
		int start = (page - 1) * pageSize;//计算出起始查询位置
		if(start<0){
			start=0;
		}
		List<School> list = schoolMapper.schoolList(school, start, pageSize);
		int count = schoolMapper.schoolcount(school);

		LayuiTableData layuiData = new LayuiTableData();
		if (list.size() > 0) {
			layuiData.setCode(0);
			layuiData.setMsg("");
			layuiData.setCount(count);
			layuiData.setData(list);
			System.out.println(school);
		} else {
			layuiData.setCode(1);
			layuiData.setMsg("查询失败");
		}
		return layuiData;
	}
	@Override
    public int schoolcount(School school){
	    return schoolMapper.schoolcount(school);
    }
    @Override
    public List<School> schoolMessageList(School school,int stripStart, int stripEnd){
	    return schoolMapper.schoolList(school,stripStart, stripEnd);
    }


	/*
	 *@Description:
	 *@Author:周永哲
	 *@Param:
	 *@return:
	 *@Date:2020/6/10
	 **/
	@Override
	public List<School> selectAllInfo(School school, int page, int limit) {
		List<School> selectAllInfo = schoolMapper.selectAllInfo(school,page,limit);
		return selectAllInfo;
	}

	@Override
	public int selectCount(School school) {
		int selectCount = schoolMapper.selectCount(school);
		return selectCount;
	}

	@Override
	public int deleteSchool(String schoolId) {
		int deleteSchool = schoolMapper.deleteSchool(schoolId);
		return deleteSchool;
	}

	@Override
	public int insertSchool(School school) {
		int insertSchool = schoolMapper.insertSchool(school);
		return insertSchool;
	}

	@Override
	public int insertSchoolAccount(Account account) {
		int insertSchoolAccount = schoolMapper.insertSchoolAccount(account);
		return insertSchoolAccount;
	}
}
