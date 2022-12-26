package com.ishanitech.ipalika.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LgMunicipality {
	
	private int municipalityId;
	private String municipalityName;
	private int provinceId;
	private int districtId;
	private boolean disabled;
}
