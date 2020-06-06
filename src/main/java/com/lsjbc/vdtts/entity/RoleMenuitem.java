package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 * 	角色-菜单关系表
 */
public class RoleMenuitem
{
	/**
	 * 主键
	 */
	private Integer rmId;

	/**
	 *角色ID
	 */
	private Integer rmRoleId;

	/**
	 *菜单项ID
	 */
	private Integer rmMenuitemId;
}
