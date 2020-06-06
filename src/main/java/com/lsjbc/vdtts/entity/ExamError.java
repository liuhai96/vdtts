package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 * 错题记录表
 */
public class ExamError
{
	/**
	 * 主键
	 */
	private Integer eeId;

	/**
	 *学员ID
	 */
	private Integer eeStudentId;

	/**
	 *错题ID
	 */
	private Integer eeQuestionId;

	/**
	 *正确答案ID
	 */
	private Integer eeAnswerRightId;

	/**
	 *错误答案ID
	 */
	private Integer eeAnswerWrongId;

	/**
	 *错题产生时间
	 */
	private String eeTime;
}
