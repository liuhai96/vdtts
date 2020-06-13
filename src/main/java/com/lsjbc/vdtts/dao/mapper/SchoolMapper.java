package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Account;
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
	School findSchoolInfo(Integer sId);
	int addSchool(School school);
	School findAccount(Account account);

	/*
	 *@Description:
	 *@Author:陈竑霖
	 *@Param:
	 *@return:
	 *@Date:2020/6/8 1591600836022
	 **/
	public int schoolcount(@Param("e") School school);
	public List<School> schoolList(@Param("e") School school, @Param("start") int start, @Param("pageSize") int pageSize);

	/*
	 *@Description:
	 *@Author:周永哲
	 *@Param:
	 *@return:
	 *@Date:2020/6/10
	 **/
	public List<School> selectAllInfo(@Param("school") School school, @Param("page") int page, @Param("limit") int limit);
	public int selectCount(@Param("school") School school);
	public int deleteSchool(String schoolId);
	public int insertSchool(School school);
	public int insertSchoolAccount(Account account);
}
