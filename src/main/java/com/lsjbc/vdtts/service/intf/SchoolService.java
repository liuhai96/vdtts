package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;

import java.util.List;


public interface SchoolService
{
    /*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591601046266
 **/
    //查驾校表
    public LayuiTableData schoolList(School school, int page, int pageSize);
    //修改驾校审核状态
    public LayuiTableData updateschoolInfo(School school);
















    public int schoolcount(School school);//李浪写  查找数据条数
    public List<School> schoolMessageList(School school,int stripStart, int stripEnd);//李浪写

}
