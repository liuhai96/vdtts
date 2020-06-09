package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.lsjbc.vdtts.service.intf.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
        return JSON.toJSONString(carService.findCarList(start,pageSize,1),SerializerFeature.DisableCircularReferenceDetect);
    }
}
