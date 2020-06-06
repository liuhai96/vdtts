package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 *模拟考试记录表
 */
public class ExamSimulateRecord
{
	/**
	 *主键
	 */
	private Integer esrId;

	/**
	 *学员ID
	 */
	private Integer esrStudentId;

	/**
	 *模拟考试成绩
	 */
	private Integer esrScore;

	/**
	 *科目等级
	 */
	private Integer esrLevel;

	/**
	 *模拟考试时间
	 */
	private String esrTime;
}
