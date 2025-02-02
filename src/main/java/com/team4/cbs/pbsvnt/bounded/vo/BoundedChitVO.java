package com.team4.cbs.pbsvnt.bounded.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoundedChitVO {
	
	private String bndwasChitNo;	// 보세창고 전표 번호
	private String entrManageNo;	// 통관 관리 번호
	private String bndwasCd;		// 보세창고 코드
	private int goodsNo;			// 상품 번호
	private String cstmrCd;			// 고객 코드
	
}
