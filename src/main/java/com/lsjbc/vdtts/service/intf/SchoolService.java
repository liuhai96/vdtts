package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591601046266
 **/
public interface SchoolService
{
    public LayuiTableData schoolList(School school, int page, int pageSize);
    public int schoolcount(School school);//李浪写  查找数据条数
    public List<School> schoolMessageList(School school,int stripStart, int stripEnd);//李浪写
    public ResultData findSchoolInfo(HttpServletRequest request, HttpServletResponse response);

}
