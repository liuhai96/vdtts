package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
/**
 *评价表
 */
public class Evaluate
{

	/**
	 *主键
	 */
	private Integer eId;

	/**
	 *学员ID
	 */
	private Integer eStudentId;

	/**
	 *评价对象ID，教练ID或驾校ID
	 */
	private Integer eToId;

	/**
	 *推荐指数
	 */
	private Float eScore;

	/**
	 *评语
	 */
	private String eContent;

	/**
	 *评论时间
	 */
	private String eTime;

	/**
	 *评价对象类型：教练/驾校
	 */
	private String eType;
}
