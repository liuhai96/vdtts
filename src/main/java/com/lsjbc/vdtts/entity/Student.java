package com.lsjbc.vdtts.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
/**
 * 	学员表
 */
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
	private Integer sSchooleId;

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
	 *s所属教练姓名
	 */
	private String teacherName;

	@Override
	public String toString() {
		return "Student{" +
				"sId=" + sId +
				", sAccountId=" + sAccountId +
				", sSchooleId=" + sSchooleId +
				", sSfz='" + sSfz + '\'' +
				", sName='" + sName + '\'' +
				", sPhone='" + sPhone + '\'' +
				", sSex='" + sSex + '\'' +
				", sBirthday='" + sBirthday + '\'' +
				", sPic='" + sPic + '\'' +
				", sLicenseTime='" + sLicenseTime + '\'' +
				", sRegTime='" + sRegTime + '\'' +
				", sTeacherId=" + sTeacherId +
				'}';
	}

	public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

	public Integer getsAccountId() {
		return sAccountId;
	}

	public void setsAccountId(Integer sAccountId) {
		this.sAccountId = sAccountId;
	}

	public Integer getsSchooleId() {
		return sSchooleId;
	}

	public void setsSchooleId(Integer sSchooleId) {
		this.sSchooleId = sSchooleId;
	}

	public String getsSfz() {
		return sSfz;
	}

	public void setsSfz(String sSfz) {
		this.sSfz = sSfz;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsSex() {
		return sSex;
	}

	public void setsSex(String sSex) {
		this.sSex = sSex;
	}

	public String getsBirthday() {
		return sBirthday;
	}

	public void setsBirthday(String sBirthday) {
		this.sBirthday = sBirthday;
	}

	public String getsPic() {
		return sPic;
	}

	public void setsPic(String sPic) {
		this.sPic = sPic;
	}

	public String getsLicenseTime() {
		return sLicenseTime;
	}

	public void setsLicenseTime(String sLicenseTime) {
		this.sLicenseTime = sLicenseTime;
	}

	public String getsRegTime() {
		return sRegTime;
	}

	public void setsRegTime(String sRegTime) {
		this.sRegTime = sRegTime;
	}

	public Integer getsTeacherId() {
		return sTeacherId;
	}

	public void setsTeacherId(Integer sTeacherId) {
		this.sTeacherId = sTeacherId;
	}
}
