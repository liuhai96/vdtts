package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.utils.mopper.CustomBaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591600836022
 **/
public interface SchoolMapper extends CustomBaseMapper<School> {
	//查表
	int schoolcount(@Param("e") School school);
	List<School> schoolList(@Param("e") School school, @Param("start") int start, @Param("pageSize") int pageSize);
	//修改审核状态
	public int updateschoolInfo(School school);
	public List<School> findschool(@Param("e") School school);

	School findSchoolInfo(Integer sId);
//	李浪
	public int addSchool(School school);
}
