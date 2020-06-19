package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.service.intf.ExamTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/lhtestController")
public class LhtestController {

    @Autowired

    private ExamTimeService examTimeService;
    @RequestMapping(value = "/studentHomepege")
    @ResponseBody
    public LayuiTableData studentHomepege(String page, String limit, HttpServletRequest request){

        return examTimeService.findStudentExamNotes(page,limit,request);
    }
}
