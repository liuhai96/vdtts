package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.service.intf.ExamTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping
public class LhtestController {

    @Autowired

    private ExamTimeService examTimeService;
    @RequestMapping(value = "zjh/studentHomepege")
    public Object studentHomepege(Map<String,Object> map){
        map.put("studentTimeList",examTimeService.findStudentExamNotes());
        return "/zjh_test/studenthomepage";
    }
}
