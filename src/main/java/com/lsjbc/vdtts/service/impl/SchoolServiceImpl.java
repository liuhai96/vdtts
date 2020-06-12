package com.lsjbc.vdtts.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lsjbc.vdtts.constant.consist.EvaluateTypeConstant;
import com.lsjbc.vdtts.dao.*;
import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.pojo.vo.SchoolDetail;
import com.lsjbc.vdtts.service.intf.SchoolService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@SuppressWarnings("all")
@Service(SchoolServiceImpl.NAME)
public class SchoolServiceImpl implements SchoolService {

	/**
	 * Bean名
	 */
	public static final String NAME = "SchoolService";

	@Resource
	private SchoolMapper schoolMapper;

	@Resource(name = SchoolDao.NAME)
	private SchoolDao schoolDao;

	@Resource(name = CarDao.NAME)
	private CarDao carDao;

	@Resource(name = StudentDao.NAME)
	private StudentDao studentDao;

	@Resource(name = EvaluateDao.NAME)
	private EvaluateDao evaluateDao;

	@Resource(name = TeacherDao.NAME)
	private TeacherDao teacherDao;

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


	@Override
	public ResultData findSchoolInfo(HttpServletRequest request, HttpServletResponse response) {
		School school = schoolMapper.findSchoolInfo(1);
		ResultData resultData = null;
		if (school != null) {
			resultData = ResultData.success("school", school);
		} else {
			resultData = ResultData.error(-1, "系统出错请稍后尝试");
		}
		return resultData;
	}

	/**
	 * 根据驾校的的名字，来分页查询数据
	 *
	 * @param name 驾校名称
	 * @param page 页数
	 * @return 分页对象
	 */
	@Override
	public Page<School> getSchoolPageByName(String name, Integer page) {
		Page<School> pageInfo = PageHelper.startPage(page, 6, true);
		schoolDao.getByNameLike(name);
		return pageInfo;
	}

	/**
	 * 根据驾校的的名字，来分页查询数据
	 *
	 * @param name 驾校名称
	 * @param page 页数
	 * @return 分页对象
	 */
	@Override
	public Page<SchoolDetail> getSchoolDetailPageByName(String name, Integer page) {

		Page<School> schools = getSchoolPageByName(name, page);

		Page<SchoolDetail> details = new Page<>();
		details.setTotal(schools.getTotal());
		details.setPages(schools.getPages());

		schools.getResult().stream().forEach(item -> {
			Integer schoolId = item.getSId();
			SchoolDetail detail = SchoolDetail.generateDetail(item);
			detail.setScore(evaluateDao.getAvgByTypeAndId(EvaluateTypeConstant.TYPE_SCHOOL, schoolId));
			detail.setCarCount(carDao.getCountBySchoolId(schoolId));
			detail.setTeacherCount(teacherDao.getCountBySchoolId(schoolId));
			detail.setStudentCount(studentDao.getCountBySchoolId(schoolId));
			details.getResult().add(detail);
		});

		return details;
	}
}
