package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("all")
@Service("schoolService")
public class SchoolServiceImp implements SchoolService
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

		LayuiTableData layuiTableData = new LayuiTableData();
		if (list.size() > 0) {
			layuiTableData.setCode(0);
			layuiTableData.setMsg("");
			layuiTableData.setCount(count);
			layuiTableData.setData(list);
			System.out.println(school);
		} else {
			layuiTableData.setCode(1);
			layuiTableData.setMsg("查询失败");
		}
		return layuiTableData;
	}
}
