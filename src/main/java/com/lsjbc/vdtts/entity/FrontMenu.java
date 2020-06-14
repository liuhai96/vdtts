package com.lsjbc.vdtts.entity;

import lombok.*;

import javax.persistence.*;

/*
前端菜单表
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Table(name = "`tb_front_menu`")
public class FrontMenu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "`fr_menu_id`")
  private long frMenuId;
    /**
     * 菜单名
     */
    @Column(name = "`fr_menu_name`")
  private String frMenuName;
    /**
     * 菜单路径
     */
    @Column(name = "`fr_url`")
  private String frUrl;
    /**
     * 父菜单ID
     */
    @Column(name = "`fr_parent_id`")
  private long frParentId;
    /**
     * 备注
     */
    @Column(name = "`notes`")
  private String notes;

}
