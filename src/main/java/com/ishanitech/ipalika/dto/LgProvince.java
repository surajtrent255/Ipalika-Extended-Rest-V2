package com.ishanitech.ipalika.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LgProvince {

	private int provinceId;
	private String provinceName;
	private boolean disabled;
	
}
