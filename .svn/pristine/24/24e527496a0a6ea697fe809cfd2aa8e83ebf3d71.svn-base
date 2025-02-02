package com.team4.cbs.main.declaration.vo;



import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TransportDeclarationVO {
	
	private int dclrtNo;            // 신고번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private String dclrtDe;         // 신고일자
	private String userCd;          // 신고자코드
	private String userCmpnm;       // 신고자상호
	private String userNm;          // 신고자명
	private String userAdres;       // 신고자주소
	private String entrManageNo;    // 통관관리번호
	private String vhcleDiaryCd;    // 차량일지코드
	private String strtPnt;         // 보세운송 출발지
	private String arvlPnt;         // 보세운송 도착지
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private String strtTime;        // 출발 일자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private String arvlTime;		// 도착 일자
	
	private int dclrtSttus;			// 제출 상태
	
	private long qy;                //수량
	private long totWt;             //총 중량
	private String thingNm;         //물품 명
	private long baggTnpakg;        //수하물 포장 개수
	
	private String blNo;        	//BL번호     
	private String cntanrInnb;		//컨테이너 고유번호
	
	private String adres;			//주소
	
}
