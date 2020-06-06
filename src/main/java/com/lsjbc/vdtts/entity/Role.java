package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 * 	角色表
 */
public class Role
{

	/**
	 * 主键
	 */
	private Integer rId;

	/**
	 * 角色名
	 */
	private String rName;
}
