package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

import java.util.List;

/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591601046266
 **/
@Service
public interface SchoolService
{
    public LayuiTableData schoolList(School school, int page, int pageSize);
    public int schoolcount(School school);//李浪写  查找数据条数
    public List<School> schoolMessageList(School school,int stripStart, int stripEnd);//李浪写

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


