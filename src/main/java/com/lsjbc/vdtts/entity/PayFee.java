package com.lsjbc.vdtts.entity;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
/*
 *@Description:
 *@Author:周永哲
 *@Param:
 *@return:
 *@Date:2020/6/23
 **/
@Table(name ="`tb_pay_fee`")
public class PayFee {
  /**
   *主键id
   */
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "`pay_id`")
  private Integer payId;
  /**
   *驾校id
   */
  @Column(name = "`school_id`")
  private Integer schoolId;
  /**
   *驾校名
   */
  @Column(name ="`school_name`")
  private String schoolName;
  /**
   *教练id
   */
  @Column(name = "`teacher_id`")
  private Integer teacherId;
  /**
   *教练姓名
   */
  @Column(name ="`teacher_name`")
  private String teacherName;
  /**
   *学生id
   */
  @Column(name ="`student_id`")
  private Integer studentId;
  /**
   *学生姓名
   */
  @Column(name ="`student_name`")
  private String studentName;
  /**
   *报名学费
   */
  @Column(name ="`register_fee`")
  private String registerFee;
  /**
   *注册报名缴费时间
   */
  @Column(name ="`fee_time`")
  private String feeTime;

  /**
   *订单号
   */
  @Column(name ="`order_number`")
  private String orderNumber;
  /**
   *订单状态
   */
  @Column(name ="`pay_statu`")
  private String payStatu;

}
