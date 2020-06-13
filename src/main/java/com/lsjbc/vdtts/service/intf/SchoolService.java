package com.lsjbc.vdtts.service.intf;

import com.github.pagehelper.Page;
import com.lsjbc.vdtts.entity.Account;
import com.lsjbc.vdtts.entity.School;
import com.lsjbc.vdtts.entity.Student;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import com.lsjbc.vdtts.pojo.vo.ResultData;
import com.lsjbc.vdtts.pojo.vo.SchoolDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/8 1591601046266
 **/
public interface SchoolService {
    LayuiTableData schoolList(School school, int page, int pageSize);

    int schoolCount(School school);//李浪写  查找数据条数

    List<School> schoolMessageList(School school, int stripStart, int stripEnd);//李浪写

    ResultData schoolToProduct(School school, String id);//学校进驻平台 李浪写

    ResultData findSchoolInfo(HttpServletRequest request, HttpServletResponse response);

    /**
     * 根据驾校的的名字，来分页查询数据
     *
     * @param name 驾校名称
     * @param page 页数
     * @return 分页对象
     */
    Page<School> getSchoolPageByName(String name, Integer page);

    /**
     * 根据驾校的的名字，来分页查询数据
     *
     * @param name 驾校名称
     * @param page 页数
     * @return 分页对象
     */
    Page<SchoolDetail> getSchoolDetailPageByName(String name, Integer page);

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/10
     **/
    public List<School> selectAllInfo(@Param("school") School school, @Param("page") int page, @Param("limit") int limit);
    public int selectCount(@Param("school") School school);
    public int deleteSchool(String schoolId);
    public int insertSchool(School school);
    public int insertSchoolAccount(Account account);
}
