package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
/**
 * 	科目学时
 */
public class ExamTime
{
	/**
	 * 	主键
	 */
	private Integer etId;

	/**
	 *学员ID
	 */
	private Integer etStudentId;

	/**
	 *学时
	 */
	private String etTime;

	/**
	 *产生学时的时间
	 */
	private String etStart;

	/**
	 *是否减半
	 */
	private String etHalf;

	/**
	 *是否有效学时
	 */
	private String etEffective;

	/**
	 *科目级别
	 */
	private Integer etLevel;
}
