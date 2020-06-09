package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
/*
 *@Description:
 *@Author:陈竑霖
 *@Param:
 *@return:
 *@Date:2020/6/9 1591681355328
 **/
/**
 * 	教练表
 */
public class Teacher
{
	/**
	 *主键
	 */
	private Integer tId;

	/**
	 *账号ID
	 */
	private Integer tAccountId;

	/**
	 *驾校ID
	 */
	private Integer tSchoolId;

	/**
	 *身份证号
	 */
	private String tSfz;

	/**
	 *姓名
	 */
	private String tName;

	/**
	 *性别
	 */
	private String tSex;

	/**
	 *出生日期
	 */
	private String tBirthday;

	/**
	 *电话号码
	 */
	private String tPhone;

	/**
	 *是否允许教新学员
	 */
	private String tTeach;

	/**
	 *是否允许登录
	 */
	private String tLock;

	/**
	 *获取驾照时间
	 */
	private String tLicenseTime;

	/**
	 *本月毕业学员数
	 */
	private String tCount;

	/**
	 *本月限制毕业学员数
	 */
	private String tLimit;
	/**
	 *教练所属的驾校名
	 */
	private String schoolName;


//	刘海
	/**
	 *教练对应的驾校
	 */
	private School school;

	private Account account;
	/**
	 *教练所属的学校名
	 */
	private String sName;
}
