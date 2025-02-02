package com.team4.cbs.trnsprt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TrnsprtCompanyVO {

	private String cmpnyCd;		//운송회사코드
	private String trnsprtGu;	//운송회사구분
	private String cmpnyNm;		//회사명
	private String cmpnyAdres;	//회사주소
	private String cmpnyTelno;	//전화번호
	private String rprsntvNm;	//대표자명
	private String bizrno;		//사업자등록번호
	
}
