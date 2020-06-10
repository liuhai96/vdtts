package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.SchoolService;
import com.lsjbc.vdtts.utils.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
@Controller
@RequestMapping("/SchoolControl")
public class SchoolControl {
	@Autowired
	private SchoolService schoolService;

	@RequestMapping(value = "/findSchoolList",produces = {"application/json;charset=UTF-8"})//初始化学员信息表
	@ResponseBody
	public Object findSchoolList(HttpServletRequest request, HttpServletResponse response){
		String pageStr = request.getParameter("page");//页码
		String pageSizeStr = request.getParameter("limit");//每页记录数
		//查名字
		String sName = request.getParameter("sName");

		String draw = request.getParameter("draw");//重绘次数 和前台对应

		School school = new School();
		school.setSName(sName);
		LayuiTableData layuiTableData = schoolService.schoolList(school, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
		return JSON.toJSONString(layuiTableData);
	}
	@RequestMapping(value = "/drivingFindInit")
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[] 功能：首页驾校界面初始
     *@return:org.springframework.web.servlet.ModelAndView
     *@Date:2020/6/10 0:52
     **/
	public ModelAndView DrivingFindInit(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("isInit",true);
        ResultData resultData = new ResultData();
        Map map = new HashMap();
        Tool tool = new Tool();
        School school = new School();
        int count = schoolService.schoolcount(school);
        int start = 0;
        if(count > 20) start = tool.getRandom(0,count-count/2);
        else start = 0;
        List<School> list = schoolService.schoolMessageList(school,start,start+20);
        List<School> schoola = new LinkedList<>();
        List<School> schoolc = new LinkedList<>();
        List<School> schoolr = new LinkedList<>();
        int i = 0;
        if(count > 20){
            for(School school1:list){
                if(i < 6) schoola.add(school1);
                else if(i < 14)schoolc.add(school1);
                else schoolr.add(school1);
                i++;
            }
        } else if(count < 10) {
            for(School school1:list){
                schoola.add(school1);
                schoolc.add(school1);
                schoolr.add(school1);
                i++;
            }
        } else {
            for(School school1:list){
                if(i < 6){
                    schoola.add(school1);
                    schoolc.add(school1);
                } else schoolr.add(school1);
                i++;
            }
        }
        modelAndView.addObject("schoola",schoola);
        modelAndView.addObject("schoolc",schoolc);
        modelAndView.addObject("schoolr",schoolr);

        modelAndView.setViewName("/pages/homepage/driving-to-find/driving-to-find");
	    return modelAndView;
    }
}
