package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
/**
 *菜单表
 */
public class Menuitem
{

	/**
	 *主键
	 */
	private Integer mId;

	/**
	 *菜单项名
	 */
	private String mName;

	/**
	 *菜单跳转路径
	 */
	private String mUrl;

	/**
	 *父级菜单项ID
	 */
	private Integer mParentId;

}
