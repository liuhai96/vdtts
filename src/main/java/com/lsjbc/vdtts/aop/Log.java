package com.lsjbc.vdtts.aop;

import com.lsjbc.vdtts.enums.OperateType;
import com.lsjbc.vdtts.enums.ResourceType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @Description: 操作日志注解
 * @Author:
 * @Date: 2020/6/5 17:56
 */

@Target(value = { ElementType.TYPE, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {
    /**
     * 动作类型
     */
    OperateType operateType();

    /**
     * 资源类型
     */
    ResourceType resourceType();

    /**
     * 具体内容
     */
    String detail() default "";

}
