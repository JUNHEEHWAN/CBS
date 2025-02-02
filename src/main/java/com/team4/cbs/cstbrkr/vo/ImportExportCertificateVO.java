package com.team4.cbs.cstbrkr.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


import lombok.Data;

@Data
public class ImportExportCertificateVO {

	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date sttemntDe;
	//신고 일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date processDe;      //처리 일
	
	private String entrManageNo;                //통관 관리 번호
	private String cstbrkrCd;                   //관세사 코드
	private String cstmrCd;                     //고객 코드
	private String client;                      //의뢰인
	private String notifyInfo;                  //통지처 정보
	private String entrSe;                      //통관 구분
	private String expterCmpnm;                 //수출자 상호
	private String expterAdres;                 //수출자 주소
	private String expterTelno;                 //수출자 전화번호
	private String expterCharger;               //수출자 담당자
	private String imprCmpnm;                   //수입자 상호
	private String imprAdres;                   //수입자 주소
	private String imprTelno;                   //수입자 전화번호
	private String imprCharger;                 //수입자 담당자
	private String manctmKwa;                   //관할 세관 과
	private String manctmKwaCharger;            //관할 세관 과 담당자
	private String qrantPlace;                  //검역 장소
	private String trnsprtStle;                 //운송 형태
	private String waybilNo;                    //운송장 번호
	private String startPrt;                    //출발 항구
	private String arvlPrt;                     //도착 항구
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date shipStartDe;                   //선박 출항 일자
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date shipEndDe;     				//선박 도착 일자 
	
	private String shipNm;                      //선박 명
	private String coudes;                      //목적국
	private int processSttus;                   //처리 상태
	private String pbsvntCd;					//공무원 코드
	private int qrantTargetAt;					//검역대상여부
	
	private String presentnPapersNo; 			//서류제출번호 B
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date papersPresentnDe;              //선박 출항 일자 B
	
	private String cntanrInnb;						// 컨테이너 고유번호 C

	private String userNm;						//사용자_명 D
	
	private String pbUserNm;						//공무원 D

	
	private int goodsNo;                 		//상품 번호 E
	private String thingTy;               		//물품 유형 E
	private long qy;                      	 	//수량 E
	private long untpc;                    		//단가 E
	private long amount;                   		//금액 E
	private long totAmount;                		//총 금액 E
	private long netwght;                  		//순 중량 E
	private long totWt;                    		//총 중량 E
	private long baggTnpakg;               		//수하물 포장 개수 E
	private String thingNm;               		//물품 명 E
	private String delngPrdnm;            		//거래품 명 E
	
	private String goodsNm;						//상품 명 E?
	private String hsCd;						//HScode E?
	
	private String requstPlace;					//보세 창고 코드 F
	
    
	private int ctTaxIemNo;						//비용세액항목번호 H
	private String ctTaxSe;						//비용세액구분 H
	private double computAmount;				//산출금액 H
    
	private String drverNm;						//운송자 R
}



