package com.lsjbc.vdtts.entity;

import lombok.Data;

@Data
/**
 *友情链接表
 */
public class Link
{
	/**
	 *主键
	 */
	private Integer lkId;

	/**
	 *链接标签
	 */
	private String lkName;

	/**
	 *跳转路径
	 */
	private String lkUrl;

	/**
	 *友情路径图标
	 */
	private String lkPic;
}
