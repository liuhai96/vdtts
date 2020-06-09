package com.lsjbc.vdtts.controller;


import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.service.intf.StudentService;
import com.lsjbc.vdtts.service.intf.TeacherService;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

//@SuppressWarnings("all")
@Controller
@RequestMapping("/pipeControl")
public class pipeControl
{
		@Autowired
		private StudentService studentService;

	    @Autowired
	    private TeacherService teacherService;
//学员表查看
		@RequestMapping(value = "/studentList",produces = {"application/json;charset=UTF-8"})
		@ResponseBody
		public String studentList(HttpServletRequest request, HttpServletResponse response) {
			String pageStr = request.getParameter("page");//页码
			String pageSizeStr = request.getParameter("limit");//每页记录数
			//查名字
			String sName = request.getParameter("sName");
			//查驾照时间
			String sLicenseTime=request.getParameter("sLicenseTime");
			String draw = request.getParameter("draw");//重绘次数 和前台对应

			Student student = new Student();
			student.setSName(sName);
			student.setSLicenseTime(sLicenseTime);
            LayuiTableData layuiData = studentService.selectList(student, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
			return JSON.toJSONString(layuiData);
		}
//	//教练表查看
//	@RequestMapping(value = "/teacherList",produces = {"application/json;charset=UTF-8"})
//	@ResponseBody
//	public String teacherList(HttpServletRequest request, HttpServletResponse response) {
//		String pageStr = request.getParameter("page");//页码
//		String pageSizeStr = request.getParameter("limit");//每页记录数
////		//查名字
////		String sName = request.getParameter("sName");
////		//查驾照时间
////		String sLicenseTime=request.getParameter("sLicenseTime");
//		String draw = request.getParameter("draw");//重绘次数 和前台对应
//
//		Student student = new Student();
////		student.setSName(sName);
////		student.setSLicenseTime(sLicenseTime);
//		LayuiData layuiData = studentService.selectList(student, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
//		return JSON.toJSONString(layuiData);
//	}
}

