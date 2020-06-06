package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 *前台人员账号表
 */
public class Account
{

	/**
	 *主键
	 */
	private Integer aId;

	/**
	 *账号
	 */
	private String aAccount;

	/**
	 *密码
	 */
	private String aPassword;

	/**
	 * 	要查询的表名
	 */
	private String aType;

}
