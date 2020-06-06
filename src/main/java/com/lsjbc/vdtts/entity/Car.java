package com.lsjbc.vdtts.entity;

import lombok.Data;

@Data
/**
 * 	驾校表
 */
public class Car
{
	/**
	 *
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
}
