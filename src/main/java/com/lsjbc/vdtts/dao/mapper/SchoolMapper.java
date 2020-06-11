package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.School;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591600836022
 **/
public interface SchoolMapper {
	public int schoolcount(@Param("e") School school);
	public List<School> schoolList(@Param("e") School school, @Param("start") int start, @Param("pageSize") int pageSize);
	public School findSchoolInfo(Integer sId);
}
