package com.lsjbc.vdtts.entity;

import lombok.*;
/**
 *前台人员账号表
 */
@Getter
@Setter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
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


	@Override
	public String toString() {
		return "Account{" +
				"aId=" + aId +
				", aAccount='" + aAccount + '\'' +
				", aPassword='" + aPassword + '\'' +
				", aType='" + aType + '\'' +
				'}';
	}
}
