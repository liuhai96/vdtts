package com.lsjbc.vdtts.pojo.vo;



import lombok.*;

import java.util.List;

/**
 * @author csd
 * layui表格的实体类
 */
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LayuiTableData
{
	private int code;
	private String msg = "";
	private int count;
	private List<?> data;
}
