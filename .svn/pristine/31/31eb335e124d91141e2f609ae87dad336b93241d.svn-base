package com.team4.cbs.cstbrkr.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EntryProcessListVO {
	private String enprstno          ;//처리번호
	private String entrManageNo      ;//통관관리번호
	private String userCd            ;//상태변경자_코드
	private String userNm            ;//상태변경자_이름
	private String telno             ;//상태변경자_번호
	private String processSttus      ;//처리상태
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd/HH:mm:ss")
	private Date processDe           ;//처리일자
	private String cstbrkrCd         ;//담당관세사_코드
	private String cstmrCd           ;//의뢰인_고객_코드
	private String client            ;//의뢰인
	private String entrSe            ;//통관 구분
	private String expterCmpnm       ;//수출자 상호
	private String expterAdres       ;//수출자 주소
	private String expterTelno       ;//수출자 전화번호
	private String expterCharger     ;//수출자 담당자
	private String imprCmpnm         ;//수입자 상호
	private String imprAdres         ;//수입자 주소
	private String imprTelno         ;//수입자 전화번호
	private String imprCharger       ;//수입자 담당자
	private String manctmKwa         ;//관할 세관 과
	private String manctmKwaCharger  ;//관할 세관 과 담당자
	private String qrantPlace        ;//검역 장소
	private String trnsprtStle       ;//운송 형태
	private String waybilNo          ;//운송장 번호
	private String startPrt          ;//출발 항구
	private String arvlPrt           ;//도착 항구
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd/HH:mm:ss")
	private Date shipStartDe       	 ;//선박 출항 일자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd/HH:mm:ss")
	private Date shipEndDe           ;//선박 도착 일자
	private String shipNm            ;//선박 명
	private String coudes            ;//목적국
	private String pbsvntCd          ;//공무원 코드
	private String qrantTargetAt     ;//검역대상여부
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd/HH:mm:ss")
	private Date sttemntDe         	 ;//통관 신고 일
}
