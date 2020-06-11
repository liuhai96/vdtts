package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Notice;
import com.lsjbc.vdtts.utils.mopper.CustomBaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 20:00
 */
public interface NoticeMapper extends CustomBaseMapper<Notice> {
    public List<Notice> getNoticeOrLaw(@Param("e") Notice notice, @Param("currentTime") String currentTime);
}
