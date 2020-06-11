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
 *@Date:2020/6/9 1591684823042
 **/
/**
 * 	教练车表
 */
public class Car
{
	/**
	 *主键
	 */
	private Integer cId;

	/**
	 * 	驾校ID
	 */
	private Integer cSchoolId;

	/**
	 * 	品牌
	 */
	private String cLogo;

	/**
	 * 	型号
	 */
	private String cModel;

	/**
	 * 	颜色
	 */
	private String cColor;

	/**
	 * 	车牌号
	 */
	private String cNumber;

	/**
	 * 	教练ID
	 */
	private Integer cTeacherId;

	/**
	 * 所属驾校名
	 */
	private String schoolName;


	/**
	 * 教练
	 */
	private Teacher teacher;



	/**
	 * 教练名字
	 */
	private String tName;

	/**
	 * 车辆禁用
	 */
	private String cLock;
}
