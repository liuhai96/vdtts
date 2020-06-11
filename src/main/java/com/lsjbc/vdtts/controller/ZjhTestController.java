package com.lsjbc.vdtts.controller;

import com.lsjbc.vdtts.service.impl.LinkServiceImpl;
import com.lsjbc.vdtts.service.impl.NoticeServiceImpl;
import com.lsjbc.vdtts.service.intf.LinkServive;
import com.lsjbc.vdtts.service.intf.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @ClassName: ZjhTestController
 * @Description:
 * @Datetime: 2020/6/11   11:16
 * @Author: JX181114 - 郑建辉
 */
@Controller
public class ZjhTestController {

    @Resource(name = NoticeServiceImpl.NAME)
    private NoticeService noticeService;

    @Resource(name = LinkServiceImpl.NAME)
    private LinkServive linkServive;

    /**
     * 访问主页
     *
     * @param map ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/index")
    public String index(Map<String, Object> map) {

        map.put("noticeList", noticeService.getIndexPageNotice());
        map.put("lawList", noticeService.getIndexPageLaw());
        map.put("linkList", linkServive.getFooterFriendLink());

        return "/zjh_test/index";
    }

    /**
     * 访问公开公示
     *
     * @param type     通知公告:notice   法律法规：law
     * @param page     要获取的特定页的数据
     * @param noticeId 要访问的通知ID
     * @param map      ModelAndView中的属性键值对
     * @return 页面
     */
    @GetMapping("zjh/publicity/{type}/{page}/{noticeId}")
    public String publicity1(@PathVariable(value = "type") String type, @PathVariable(value = "page") Integer page
            , @PathVariable(value = "noticeId") Integer noticeId, Map<String, Object> map) {

        map.put("linkList", linkServive.getFooterFriendLink());
        map.put("type",type);
        map.put("page",page);
        map.put("noticeId",noticeId);

        if(noticeId>0){
            map.put("notice",noticeService.getById(noticeId));
        }

        return "/zjh_test/publicity";
    }
}
