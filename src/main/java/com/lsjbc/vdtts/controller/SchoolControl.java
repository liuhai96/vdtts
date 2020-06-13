package com.lsjbc.vdtts.controller;

import com.alibaba.fastjson.JSON;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.Link;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.AccountService;
import com.lsjbc.vdtts.service.intf.LinkServive;
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
	@Autowired
    private LinkServive linkServive;
	@Autowired
    private AccountService accountService;
/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/11 1591846535905
 **/
	@RequestMapping(value = "/findSchoolList",produces = {"application/json;charset=UTF-8"})//驾校查询
	@ResponseBody
	public Object findSchoolList(HttpServletRequest request, HttpServletResponse response ,School school){
		String pageStr = request.getParameter("page");//页码
		String pageSizeStr = request.getParameter("limit");//每页记录数
		String draw = request.getParameter("draw");//重绘次数 和前台对应

		LayuiTableData layuiTableData = schoolService.schoolList(school, Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
		return JSON.toJSONString(layuiTableData);
	}

	/*
	 *@Description:修改审核状态
	 *@Author:陈竑霖
	 *@Param:[teacher]
	 *@return:java.lang.String
	 *@Date:2020/6/8 21:49
	 **/
	@RequestMapping(value = "/findschool")
	public String findschool(School school){
		return JSON.toJSONString(schoolService.findschool(school));
	}

	@RequestMapping(value = "/updateschoolInfo")
	@ResponseBody
	public LayuiTableData updateschoolInfo(School school){
		LayuiTableData layuiTableData = schoolService.updateschoolInfo(school);
		return layuiTableData;
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
        ResultData resultData = new ResultData();
        Map map = new HashMap();
        Tool tool = new Tool();
        School school = new School();
        int count = schoolService.schoolCount(school);
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
        modelAndView.addObject("links",linkServive.drivingSchoolBlogroll(new Link()));
        modelAndView.setViewName("/pages/homepage/driving-to-find/driving-to-find");
	    return modelAndView;
    }

    /*
     *@Description:
     *@Author:刘海
     *@Param:[request, response]
     *@return:java.lang.Object
     *@Date:2020/6/11 23:15
     **/

    @RequestMapping(value = "/findSchoolInfo")
    public Object findSchoolInfo(HttpServletRequest request, HttpServletResponse response){
        System.out.println("JSON.toJSONString(schoolService.findSchoolInfo(request,response):>>>>>>)"+JSON.toJSONString(schoolService.findSchoolInfo(request,response)));
	    return schoolService.findSchoolInfo(request,response);
    }

    @RequestMapping(value = "/drivingIn")
    /*
     *@Description:
     *@Author:李浪_191019
     *@Param:[file]
     *@return:java.lang.Object
     *@Date:2020/6/11 11:52
     **/
    @ResponseBody
    private String DrivingIn(School school, Account account){
        Tool tool = new Tool();
        account.setAType("school");
        account.setAPassword(tool.createMd5(account.getAPassword()));//转MD5码

        if(school.getSRegisteryFee() < 10) school.setSRegisteryFee(4000);
        school.setSRegTime(tool.getDate("yyyy/MM/dd HH:mm:ss"));
        accountService.addAccountData(account);//加入登录账号
        school.setSAccountId(account.getAId());
        if(school.getSBusinessPic() == null) school.setSBusinessPic("/image/sch.jpg");
	    return JSON.toJSONString(schoolService.schoolToProduct(school,account.getAAccount()));
    }

    @RequestMapping(value = "/updateSchoolBasicInfo")
    private Object updateSchoolBasicInfo(School school){
        System.out.println("school"+school);
        return null;
//        return JSON.toJSONString(schoolService.updateSchoolBasicInfo(school));
    }
}
