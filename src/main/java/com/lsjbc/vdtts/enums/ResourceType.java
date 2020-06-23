package com.lsjbc.vdtts.enums;

import com.lsjbc.vdtts.dao.mapper.CarMapper;
import com.lsjbc.vdtts.dao.mapper.LogMapper;
import com.lsjbc.vdtts.dao.mapper.SchoolMapper;
import com.lsjbc.vdtts.dao.mapper.TeacherMapper;
import tk.mybatis.mapper.common.Mapper;

/**
 * @Description: 资源类型
 * @Author:
 * @Date: 2020/6/5 18:22
 */
public enum ResourceType {
    OPERATION_LOG("操作日志", LogMapper.class),
    CAR("教练车", CarMapper.class),
    School("驾校", SchoolMapper.class),
    Teacher("教练", TeacherMapper.class);
    private String name;
    private Class<? extends Mapper> mapper;

    public String getName() {
        return name;
    }

    public Class<? extends Mapper> getMapper() {
        return mapper;
    }

    ResourceType(String name, Class<? extends Mapper> mapper) {
        this.name = name;
        this.mapper = mapper;
    }

    public static ResourceType getTarget(String value) {
        ResourceType[] resourceTypes = ResourceType.values();
        ResourceType target = null;
        for (ResourceType resourceType : resourceTypes) {
            if (value.equals(resourceType.getName())) {
                target = resourceType;
                break;
            }
        }
        return target;
    }
}
