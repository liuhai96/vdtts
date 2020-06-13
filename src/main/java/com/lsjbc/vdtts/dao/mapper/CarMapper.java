package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.utils.mopper.CustomBaseMapper;
import com.lsjbc.vdtts.entity.School;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface CarMapper extends CustomBaseMapper<Car> {
    public int findCarCount(@Param("cSchoolId") int cSchoolId);
    public ArrayList<Car> findCarManageList(@Param("start") int start,@Param("pageSize") int pageSize,@Param("cSchoolId") int cSchoolId);
    public int updateCarInfo(Car car);
    public int deleteCar(@Param("cId") int cId);
    public int addCar(Car car);
    public ArrayList<Car> findCarList(@Param("start") int start,@Param("pageSize") int pageSize,@Param("cSchoolId") int cSchoolId);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607995566
     **/
    public int carlistcount(@Param("e") Car car);
    public List<Car> finecarlist(@Param("e") Car car, @Param("start") int start, @Param("pageSize") int pageSize);

    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/11
     **/
    public List<Car> selectAllInfo(@Param("car") Car car, @Param("page") int page, @Param("limit") int limit);
    public int selectCarCount(@Param("car") Car car);
}
