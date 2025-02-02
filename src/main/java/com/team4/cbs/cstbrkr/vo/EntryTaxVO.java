package com.team4.cbs.cstbrkr.vo;

import lombok.Data;

@Data
public class EntryTaxVO {
	private String entrManageNo;	//통관관리번호
	private int ctTaxIemNo;			//비용세액항목번호
	private String ctTaxSe;			//비용세액구분
	private double computAmount;		//산출금액
}
