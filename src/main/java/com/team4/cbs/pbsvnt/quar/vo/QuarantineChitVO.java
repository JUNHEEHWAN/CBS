package com.team4.cbs.pbsvnt.quar.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class QuarantineChitVO {
	
	private String qrantChitNo;		// 검역 전표 번호
	private String entrManageNo;	// 통관 관리 번호
	private int qrantIemAmount;		// 검역 항목 별 금액
	private String qrantIemNo;		// 검역 항목 번호 
	private int goodsNo;			// 상품 번호
	private String cstmrCd;			// 고객 코드
	private String qrantRequestCd;		// 검역 정보 코드
	
}
