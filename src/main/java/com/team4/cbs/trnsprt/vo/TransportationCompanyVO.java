package com.team4.cbs.trnsprt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TransportationCompanyVO {
	
	private String cmpnyCd;		// 운송 회사 코드
	private String trnsprtGu;	// 운송 수단 구분
	private String cmpnyNm;		// 회사 명
	private String cmpnyAdres;	// 회사 주소
	private String cmpnyTelno;	// 전화번호
	private String rprsntvNm;	// 대표자 명
	private String bizrno;		// 사업자등록번호

}
