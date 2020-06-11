package com.lsjbc.vdtts.service.impl;

import com.lsjbc.vdtts.dao.mapper.AccountMapper;
import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.service.intf.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("all")
@Service("schoolService")
public class SchoolServiceImpl implements SchoolService
{
	@Autowired
    private SchoolMapper schoolMapper;
	/*
	 *@Description:
	 *@Author:陈竑霖
	 *@Param:
	 *@return:
	 *@Date:2020/6/8 1591587038161
	 **/
	@Override
	public LayuiTableData schoolList(School school, int page, int pageSize)
	{
		int start = (page - 1) * pageSize;//计算出起始查询位置
		if(start<0){
			start=0;
		}
		List<School> list = schoolMapper.schoolList(school, start, pageSize);
		int count = schoolMapper.schoolcount(school);

		LayuiTableData layuiData = new LayuiTableData();
		if (list.size() > 0) {
			layuiData.setCode(0);
			layuiData.setMsg("");
			layuiData.setCount(count);
			layuiData.setData(list);
			System.out.println(school);
		} else {
			layuiData.setCode(1);
			layuiData.setMsg("查询失败");
		}
		return layuiData;
	}
	@Override
    public int schoolCount(School school){
	    return schoolMapper.schoolcount(school);
    }
    @Override
    public List<School> schoolMessageList(School school,int stripStart, int stripEnd){
	    return schoolMapper.schoolList(school,stripStart, stripEnd);
    }
    @Override
    public ResultData schoolToProduct(School school,String id){
        ResultData resultData = ResultData.success();
        if(schoolMapper.addSchool(school) > 0){
            resultData.put("result","恭喜！"+school.getSName()+" 已经成入驻本平台\n\n" +
                    "你的平台管理账号为："+id+
                "\n\n在审核通过后，您就可以在本平台上管理您的驾校了");
        } else {
            resultData.put("result","很遗憾！未知原因导致"+school.getSName()+"未能成功入驻本平台\n\n" +
                    "请重试或者联系我们的工作人员！给您带来的不便敬请谅解！");
        }
        return resultData;
    }

}
