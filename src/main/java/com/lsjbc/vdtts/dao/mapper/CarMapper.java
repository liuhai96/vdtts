package com.lsjbc.vdtts.dao.mapper;

import com.lsjbc.vdtts.entity.Car;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
@Mapper
public interface CarMapper {
    public int findCarCount(@Param("cSchoolId") int cSchoolId);
    public ArrayList<Car> findCarList(@Param("start") int start,@Param("pageSize") int pageSize,@Param("cSchoolId") int cSchoolId);
}
