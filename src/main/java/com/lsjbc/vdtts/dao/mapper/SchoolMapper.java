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


	//查表
	int schoolcount(@Param("e") School school);
	List<School> schoolList(@Param("e") School school, @Param("start") int start, @Param("pageSize") int pageSize);

	//修改审核状态
	public int updateschoolInfo(School school);
	public List<School> findschool(@Param("e") School school);

	//修改禁止招生
	public int punishcall(@Param("sId") int sId);

	//修改解禁招生
	 int unbindcall(@Param("sId") int sId);

	//修改禁止登录
    int punishlogon(@Param("sId") int sId);

	//修改解禁登录
    int unbindlogon(@Param("sId") int sId);

	/*
	 *@Description:
	 *@Author:刘海
	 *@Param:
	 *@return:
	 *@Date:2020/6/13 15:54
	 **/
	int updateSchoolBasicInfo(School school);

	School findSchoolInfo(Integer sId);

	/*
	 *@Description:
	 *@Author:李浪
	 *@Param:
	 *@return:
	 *@Date:2020/6/13 1592034621788
	 **/

	int addSchool(School school);
	School findAccount(Account account);


	/*
	 *@Description:
	 *@Author:周永哲
	 *@Param:
	 *@return:
	 *@Date:2020/6/10
	 **/
	List<School> selectAllInfo(@Param("school") School school, @Param("page") int page, @Param("limit") int limit);

	int selectSchoolCount(@Param("school") School school);

	int deleteSchool(String schoolId);
	int insertSchool(School school);
	int insertSchoolAccount(Account account);
}
