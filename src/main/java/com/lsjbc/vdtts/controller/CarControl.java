package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.service.intf.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/carControl")
public class CarControl {
    @Autowired
    private CarService carService;

    /*
     *@Description:查询驾校内教练车辆基本信息
     *@Author:刘海
     *@Param:
     *@return:
     *@Date:2020/6/8 23:22
     **/
    @RequestMapping(value = "/findCarList")
    public String findCarList(HttpServletRequest request, HttpServletResponse response){
        String page = request.getParameter("page");//接收前端界面的分页在第几页
        String limit = request.getParameter("limit");//接收前端界面查询数量
//        String tSchoolId = request.getParameter("tShoolId");//接收前端保存的驾校id
        int pageSize = Integer.parseInt(limit);
        int start = (Integer.parseInt(page)-1)*pageSize;//计算从数据库第几条开始查
        return JSON.toJSONString(carService.findCarManageList(start,pageSize,1),SerializerFeature.DisableCircularReferenceDetect);
    }


    /*
     *@Description:修改教练车的信息
     *@Author:刘海
     *@Param:[car]
     *@return:java.lang.String
     *@Date:2020/6/9 19:49
     **/
    @RequestMapping(value = "/updateCarInfo")
    public String updateCarInfo(Car car){
        return JSON.toJSONString(carService.updateCarInfo(car));
    }

    /*
     *@Description:
     *@Author:刘海
     *@Param:[cId]
     *@return:java.lang.String
     *@Date:2020/6/9 20:48
     **/
    @RequestMapping(value = "/deleteCar")
    public  String deleteCar(int cId){
        return JSON.toJSONString(carService.deleteCar(cId));
    }

    @RequestMapping(value = "/addCar")
    public Object addCar(Car car){
        return JSON.toJSONString(carService.addCar(car));
    }
/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/9 1591683706914
 **/
//车辆表
    @RequestMapping(value = "/carList",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String carList(HttpServletRequest request, HttpServletResponse response) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数
        //查车牌
        String cNumber = request.getParameter("cNumber");
        String draw = request.getParameter("draw");//重绘次数 和前台对应

        Car car = new Car();
        car.setCNumber(cNumber);
        LayuiTableData layuiTableData = carService.carList(car, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiTableData);
    }
}
