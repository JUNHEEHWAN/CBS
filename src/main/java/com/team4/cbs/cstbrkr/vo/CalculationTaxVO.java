package com.team4.cbs.cstbrkr.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Setter
@Getter
@ToString
public class CalculationTaxVO {
	
	private String entrManageNo;	// 통관 관리 번호
//	private int ctTaxIemNo;			// 비용 세액 항목 번호
	private int calcAmount;			// 산정 금액
	
}
