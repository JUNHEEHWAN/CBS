package com.team4.cbs.cstbrkr.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EntryVO {
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd/HH:mm:ss") // ajax - 날짜(Date) 받아오기 https://kimfk567.tistory.com/34 -한봄-
	private Date sttemntDe;                     //신고 일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd/HH:mm:ss")
	private Date processDe;                     //처리 일
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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm")
	private Date shipStartDe;                   //선박 출항 일자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm")
	private Date shipEndDe;     				//선박 도착 일자 
	private String shipNm;                      //선박 명
	private String coudes;                      //목적국
	private int processSttus;                   //처리 상태
	private String pbsvntCd;					//공무원 코드
	private int qrantTargetAt;					//검역대상여부
}
