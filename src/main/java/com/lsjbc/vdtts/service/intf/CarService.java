package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.entity.Car;
import com.lsjbc.vdtts.pojo.vo.LayuiTableData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CarService {
    LayuiTableData findCarManageList(String page, String limit, String cNember, int cSchoolId);

    LayuiTableData updateCarInfo(Car car);

    LayuiTableData deleteCar(int cId);

    LayuiTableData addCar(Car car);

    /*
     *@Description:
     *@Author:陈竑霖
     *@Param:
     *@return:
     *@Date:2020/6/8 1591607662706
     **/
    LayuiTableData carList(Car car, int page, int pageSize);


    /*
     *@Description:
     *@Author:周永哲
     *@Param:
     *@return:
     *@Date:2020/6/11
     **/
    List<Car> selectAllInfo(@Param("car") Car car, @Param("page") int page, @Param("limit") int limit);

    int selectCarCount(@Param("car") Car car);
}
