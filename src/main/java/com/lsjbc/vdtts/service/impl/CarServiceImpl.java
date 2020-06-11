package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.CarMapper;
import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CarServiceImpl implements CarService {
    @Autowired
    private CarMapper carMapper;

    @Override
    /*
     *@Description:查询教练车
     *@Author:刘海
     *@Param:[start, pageSize, cSchoolId]
     *@return:com.lsjbc.vdtts.pojo.vo.LayuiTableData
     *@Date:2020/6/9 14:35
     **/
    public LayuiTableData findCarManageList(int start, int pageSize, int cSchoolId) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int carCount = carMapper.findCarCount(cSchoolId);
        ArrayList<Car> carList = carMapper.findCarManageList(start,pageSize,cSchoolId);
        System.out.println("carList"+carList);
        layuiTableData.setCount(carCount);
        layuiTableData.setCode(0);
        layuiTableData.setData(carList);
        return layuiTableData;
    }

    @Override
    public LayuiTableData updateCarInfo(Car car) {
        LayuiTableData layuiTableData = new LayuiTableData();
        if(car.getCTeacherId()==0){
            layuiTableData.setCode(0);
        }else{
            int num = carMapper.updateCarInfo(car);
            if(num>0){
                layuiTableData.setCode(1);
            }else{
                layuiTableData.setCode(2);
            }

        }
        return layuiTableData;
    }

    @Override
    public LayuiTableData deleteCar(int cId) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int num = carMapper.deleteCar(cId);
        if(num>0){
            layuiTableData.setCode(1);
        }else{
            layuiTableData.setCode(0);
        }
        return layuiTableData;
    }

    @Override
    public LayuiTableData addCar(Car car) {
        LayuiTableData layuiTableData = new LayuiTableData();
        int num = carMapper.addCar(car);
        if(num>0){
            layuiTableData.setCode(1);
        }
        return layuiTableData;
    }

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591587038161
     **/
    @Override
    public LayuiTableData carList(Car car, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0){
            start=0;
        }
        List<Car> list = carMapper.finecarlist(car, start, pageSize);
        int count = carMapper.carlistcount(car);

        LayuiTableData layuiTableData = new LayuiTableData();
        if (list.size() > 0) {
            layuiTableData.setCode(0);
            layuiTableData.setMsg("");
            layuiTableData.setCount(count);
            layuiTableData.setData(list);
            System.out.println(car);
        } else {
            layuiTableData.setCode(1);
            layuiTableData.setMsg("查询失败");
        }
        return layuiTableData;
    }
}
