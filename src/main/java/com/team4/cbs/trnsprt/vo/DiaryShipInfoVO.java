package com.team4.cbs.trnsprt.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class DiaryShipInfoVO {

	private int imoNo;          //IMO 번호   
	private String shipNm;      //선박 명     
	private String cmpnyNm;		//선박 회사 이름
	
}
