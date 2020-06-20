package com.lsjbc.vdtts.api;

import com.lsjbc.vdtts.service.impl.RobotServiceImpl;
import com.lsjbc.vdtts.service.intf.RobotService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @ClassName: RobotApi
 * @Description:
 * @Datetime: 2020/6/21   1:44
 * @Author: JX181114 - 郑建辉
 */
@CrossOrigin
@RestController
@RequestMapping("api/robot")
public class RobotApi {

    @Resource(name = RobotServiceImpl.NAME)
    private RobotService robotService;

    /**
     *
     * @param content
     * @return
     */
    @PostMapping("talk")
    public String talk(String content){
        return robotService.talkToRobot(content);
    }
}
