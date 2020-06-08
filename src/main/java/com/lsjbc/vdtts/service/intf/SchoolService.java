package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiData;
/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591601046266
 **/
public interface SchoolService
{
    public LayuiData schoolList(School school, int page, int pageSize);

}
