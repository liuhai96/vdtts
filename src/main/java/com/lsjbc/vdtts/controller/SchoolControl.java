package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
}
