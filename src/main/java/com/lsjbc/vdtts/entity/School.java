package com.lsjbc.vdtts.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
/**
 * 	驾校表
 */
public class School
{
	/**
	 * 	主键
	 */
	private Integer sId;

	/**
	 * 	账号ID
	 */
	private Integer sAccountId;

	/**
	 * 	驾校名
	 */
	private String sName;

	/**
	 * 	驾校地址
	 */
	private String sAddress;

	/**
	 * 	驾校报名电话
	 */
	private String sPhone;

	/**
	 * 	统一信用代码
	 */
	private String sBusinessId;

	/**
	 * 	营业执照照片保存路径
	 */
	private String sBusinessPic;

	/**
	 *法人身份证号
	 */
	private String sOwnerId;

	/**
	 *是否通过审核
	 */
	private String sVerificattion;

	/**
	 *是否允许招生
	 */
	private String sRecruit;

	/**
	 *是否允许登录
	 */
	private String sLock;

	/**
	 *注册时间
	 */
	private String sRegTime;

	/**
	 *法人代表证件
	 */
	private String sOwnerPic;
}
