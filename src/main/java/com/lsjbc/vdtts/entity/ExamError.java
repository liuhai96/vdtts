package com.lsjbc.vdtts.entity;

import lombok.*;

import javax.persistence.*;

/**
 * 错题记录表
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Table(name = "`tb_exam_error`")
public class ExamError
{
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "`ee_id`")
	private Integer eeId;

	/**
	 * 模拟考试记录ID
	 */
	@Column(name = "`ee_record_id`")
	private Integer eeRecordId;

	/**
	 *错题ID
	 */
	@Column(name = "`ee_question_id`")
	private Integer eeQuestionId;
}
