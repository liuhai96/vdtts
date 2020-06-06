package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
/**
 *考试结束表
 */
public class ExamResult
{
	/**
	 *主键
	 */
	private Integer erId;

	/**
	 *学员ID
	 */
	private Integer erStudentId;

	/**
	 *科一成绩
	 */
	private Integer erScore1;

	/**
	 *科一考试状态
	 */
	private String erState1;

	/**
	 *科二学时
	 */
	private Integer erTime2;

	/**
	 *科二成绩
	 */
	private Integer erScore2;

	/**
	 *科二考试状态
	 */
	private String erState2;

	/**
	 *科三学时
	 */
	private Integer erTime3;

	/**
	 *科三成绩
	 */
	private Integer erScore3;

	/**
	 *科三考试状态
	 */
	private String erState3;

	/**
	 *科四学时
	 */
	private Integer erTime4;

	/**
	 *科四成绩
	 */
	private Integer erScore4;

	/**
	 *科四考试状态
	 */
	private String erState4;
}
