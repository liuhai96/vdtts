package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 *管理员表
 */
public class AdminAccount
{
	/**
	 *主键
	 */
	private Integer acId;

	/**
	 *	账号
	 */
	private String acAccount;

	/**
	 *密码
	 */
	private String acPassword;

	/**
	 *姓名
	 */
	private String acName;

	/**
	 *手机号
	 */
	private String acPhone;
}
