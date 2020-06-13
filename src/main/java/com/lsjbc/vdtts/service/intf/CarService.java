package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface CarService {
    public LayuiTableData findCarManageList(int start,int pageSize,int cSchoolId);
    public LayuiTableData updateCarInfo(Car car);
    public LayuiTableData deleteCar(int cId);
    public LayuiTableData addCar(Car car);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607662706
     **/
    public LayuiTableData carList(Car car, int page, int pageSize);


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
