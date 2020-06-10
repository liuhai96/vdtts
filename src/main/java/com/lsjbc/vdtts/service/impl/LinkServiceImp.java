package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.LinkMapper;
import com.lsjbc.vdtts.entity.Link;
import com.lsjbc.vdtts.service.intf.LinkServive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LiLang9725
 * @date 2020/6/10 11:28
 */
@Service
public class LinkServiceImp implements LinkServive {
    @Autowired
    private LinkMapper linkMapper;
    @Override
    public List<Link> drivingSchoolBlogroll(Link link){

        return null;
    }
}
