package com.lsjbc.vdtts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tk.mybatis.spring.annotation.MapperScan;

/**
 * 开启缓存
 */
@EnableCaching
/**
 * 开启注解版的定时任务
 */
@EnableScheduling
/**
 * 开启事务管理
 */
@EnableTransactionManagement
/**
 * 开启基于注解版的异步处理
 */
@EnableAsync
/**
 * 会自动装配指定包下面所有Mapper，省的在每个Mapper上写@Mapper注解
 */
@MapperScan(basePackages = {
        "com.lsjbc.vdtts.dao.mapper"
})
@SpringBootApplication
public class VdttsApplication {

    public static void main(String[] args) {
        SpringApplication.run(VdttsApplication.class, args);
    }

}
