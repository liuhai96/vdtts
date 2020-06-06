package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 * 	日志表
 */
public class Log
{

	/**
	 * 	主键
	 */
	private Integer lgId;

	/**
	 *产生日志的模块
	 */
	private String lgModel;

	/**
	 *日志信息
	 */
	private String lgDetail;

	/**
	 *记录时间
	 */
	private String lgTime;
}
