package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;

public interface CarService {
    public LayuiTableData findCarList(int start,int pageSize,int cSchoolId);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607662706
     **/
    public LayuiTableData carList(Car car, int page, int pageSize);
}
