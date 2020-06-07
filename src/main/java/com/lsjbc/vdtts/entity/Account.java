package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
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


	@Override
	public String toString() {
		return "Account{" +
				"aId=" + aId +
				", aAccount='" + aAccount + '\'' +
				", aPassword='" + aPassword + '\'' +
				", aType='" + aType + '\'' +
				'}';
	}

	public Integer getaId() {
		return aId;
	}

	public void setaId(Integer aId) {
		this.aId = aId;
	}

	public String getaAccount() {
		return aAccount;
	}

	public void setaAccount(String aAccount) {
		this.aAccount = aAccount;
	}

	public String getaPassword() {
		return aPassword;
	}

	public void setaPassword(String aPassword) {
		this.aPassword = aPassword;
	}

	public String getaType() {
		return aType;
	}

	public void setaType(String aType) {
		this.aType = aType;
	}
}
