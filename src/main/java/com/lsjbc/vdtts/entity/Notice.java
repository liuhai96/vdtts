package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
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
	 *发布时间
	 */
	private String nTime;

	/**
	 *点击跳转路径
	 */
	private String nUrl;

	/**
	 *类型（法律法规/通知公告）
	 */
	private String nType;
}
