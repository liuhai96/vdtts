package com.lsjbc.vdtts.entity;

import lombok.Data;

@Data
/**
 * 管理员-角色关系表
 */
public class AdminRole
{

	/**
	 *主键
	 */
	private Integer arId;

	/**
	 *管理员ID
	 */
	private Integer arAdminId;

	/**
	 *角色ID
	 */
	private Integer arRoleId;
}
