package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.CarMapper;
import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@Transactional
public class CarImpl implements CarService {
    @Autowired
    private CarMapper carMapper;



    @Override
    /*
     *@Description:查询加校内的教练车
     *@Author:刘海
     *@Param:[cSchoolId]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/8 23:19
     **/
    public LayuiTableData findCarList(int start,int pageSize,int cSchoolId) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int carCount = carMapper.findCarCount(cSchoolId);
       ArrayList<Car> carList = carMapper.findCarList(start,pageSize,cSchoolId);
       layuiTableData.setCount(carCount);
       layuiTableData.setCode(0);
       layuiTableData.setData(carList);
        return layuiTableData;
    }
}
