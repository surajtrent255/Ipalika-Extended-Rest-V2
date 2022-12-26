package com.ishanitech.ipalika.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LgDistrict {
	
	private int districtId;
	private String districtName;
	private int provinceId;
	private boolean disabled;

}
