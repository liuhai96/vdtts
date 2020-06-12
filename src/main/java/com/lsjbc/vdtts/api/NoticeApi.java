package com.lsjbc.vdtts.api;

import com.github.pagehelper.Page;
import com.lsjbc.vdtts.entity.Notice;
import com.lsjbc.vdtts.pojo.vo.LayuiPageData;
import com.lsjbc.vdtts.service.impl.NoticeServiceImpl;
import com.lsjbc.vdtts.service.intf.NoticeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @ClassName: NoticeApi
 * @Description:
 * @Datetime: 2020/6/12   0:08
 * @Author: JX181114 - 郑建辉
 */
@CrossOrigin
@RestController
@RequestMapping("api/notice")
public class NoticeApi {

    @Resource(name = NoticeServiceImpl.NAME)
    private NoticeService noticeService;

    /**
     * 分页获取通知公告/法律法规
     *
     * @param type 通知公告/法律法规
     * @param page 页数
     * @return 分页对象
     */
    @GetMapping("getList")
    public LayuiPageData<Notice> publicity1(String type, Integer page) {

        Page<Notice> pageInfo = noticeService.getPageByType(type, page);

        LayuiPageData<Notice> pageData = new LayuiPageData<>();

        pageData.setCount(pageInfo.getTotal());

        pageData.setPages(pageInfo.getPages());

        pageData.setList(pageInfo.getResult());

        return pageData;
    }
}
