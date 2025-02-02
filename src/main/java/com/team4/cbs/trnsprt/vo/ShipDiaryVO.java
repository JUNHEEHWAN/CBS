package com.team4.cbs.trnsprt.vo;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ShipDiaryVO {
	
	private String shipDiaryCd; //선박 일지 코드 
	private String startPrt;    //출발 항구    
	private String arvlPrt;     //도착 항구    
	private String shipDest;    //목적국가
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private String shipStartDe;   //선박 출발 일자 
	private String shipNm;      //선박 명     
	private String blNo;        //BL번호     
	private int imoNo;          //IMO 번호
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private String shipEndDe;     //선박 도착 일자 
	
	private String cmpnyNm;		//선박 회사 이름
	
}
