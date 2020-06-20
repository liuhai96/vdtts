package com.lsjbc.vdtts.service.intf;

/**
 * @ClassName: RobotService
 * @Description: 智能机器人Service层
 * @Datetime: 2020/6/21   1:08
 * @Author: JX181114 - 郑建辉
 */
public interface RobotService {

    /**
     * 和智能机器人交谈
     *
     * @param str 对机器人说的话
     * @return 机器人对你说的话
     * @author JX181114 --- 郑建辉
     */
    String talkToRobot(String str);

}
