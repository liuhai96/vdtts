package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 * 	法律法规/通知公告表
 */
public class Notice
{
	/**
	 * 主键
	 */
	private Integer nId;

	/**
	 *法律法规内容
	 */
	private String nName;

	/**
	 *点击跳转路径
	 */
	private String nTime;

	/**
	 *发布时间
	 */
	private String nUrl;

	/**
	 *类型（法律法规/通知公告）
	 */
	private String nType;
}