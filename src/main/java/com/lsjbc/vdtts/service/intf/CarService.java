package com.lsjbc.vdtts.service.intf;

import com.lsjbc.vdtts.pojo.vo.LayuiTableData;

public interface CarService {
    public LayuiTableData findCarList(int start,int pageSize,int cSchoolId);
}
