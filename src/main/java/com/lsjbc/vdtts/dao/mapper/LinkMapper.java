package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Link;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 11:16
 */

public interface LinkMapper {
    public List<Link> getBlogroll(@Param("e") Link link, @Param("start")int start, @Param("size")int size);

}
