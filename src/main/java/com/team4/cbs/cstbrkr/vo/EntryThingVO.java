package com.team4.cbs.cstbrkr.vo;

import lombok.Data;

@Data
public class EntryThingVO {
	private String entrManageNo;          //통관 관리 번호
	private int goodsNo;                  //상품 번호
	private String cstmrCd;               //고객 코드
	private String thingTy;               //물품 유형
	private long qy;                       //수량
	private long untpc;                    //단가
	private long amount;                   //금액
	private long totAmount;                //총 금액
	private long netwght;                  //순 중량
	private long totWt;                    //총 중량
	private long baggTnpakg;               //수하물 포장 개수
	private String thingNm;               //물품 명
	private String delngPrdnm;            //거래품 명
	
	private String goodsNm;					//상품 명
	private String hsCd;					//HScode
}                                        
