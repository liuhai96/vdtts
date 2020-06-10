package com.lsjbc.vdtts.entity;

import lombok.*;

/**
 * 	学员表
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Student
{
	/**
	 *主键
	 */
	private Integer sId;

	/**
	 *账号ID
	 */
	private Integer sAccountId;

	/**
	 *驾校ID
	 */
	private Integer sSchoolId;

	/**
	 *身份证号
	 */
	private String sSfz;

	/**
	 *姓名
	 */
	private String sName;

	/**
	 *电话号码
	 */
	private String sPhone;

	/**
	 *性别
	 */
	private String sSex;

	/**
	 *出生日期
	 */
	private String sBirthday;

	/**
	 *人像保存路径
	 */
	private String sPic;

	/**
	 *获取驾照日期
	 */
	private String sLicenseTime;

	/**
	 *注册时间
	 */
	private String sRegTime;

	/**
	 *所属教练ID
	 */
	private Integer sTeacherId;

	/**
	 *驾校姓名
	 */
	private String schoolName;

	/**
	 *所属教练姓名
	 */
	private String teacherName;


}
