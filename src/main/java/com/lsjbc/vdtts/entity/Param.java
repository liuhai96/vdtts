package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 * 	参数表
 */
public class Param
{

	/**
	 * 主键
	 */
	private Integer pmId;

	/**
	 *键
	 */
	private String pmKey;

	/**
	 *值
	 */
	private String pmValue;

	/**
	 *描述
	 */
	private String pmDescribe;
}
