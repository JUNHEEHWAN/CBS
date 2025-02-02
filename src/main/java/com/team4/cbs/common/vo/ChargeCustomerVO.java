package com.team4.cbs.common.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ChargeCustomerVO {
	private String cstmrCd; 		//고객 코드
	private String cstbrkrCd; 		//관세사코드
	
	//CUSTOM테이블 속성 추가
	private String entrprsNm; 		//기업_명
	private String bizrno; 			//사업자_등록_번호
	private String ectmrk; 			//통관고유부호
	private String mfrcRealmSe; 	//주력_분야_구분(공통코드)          
	private String bsnAt; 			//영업_여부 (T: 영업중, F:폐업)    
	private String crmnlHist; 		//범죄_이력 (T: 있음, F: 없음)    
	private String taxNpymHist; 	//세금_체납_이력 (T: 있음, F: 없음) 
	private String processSttus; 	//처리_상태 (공통코드)            
	private String reprsntAdres; 	//대표주소
	private String reprsntDetailAdres; 	//상세주소
	private String reprsntTelno; 	//대표전화번호
	private String reprsntEmail; 	//대표이메일
	private String charger; 		//담당자
	private String scaleSe; 	//규모구분
	
	//LEGAL PERSON테이블 속성 추가
	private String cprCstmrCd;		//법인고객코드
	private String cprNo;			//법인번호
	
	//INDIVIDUAL_PERSON 테이블 속성 추가
	private String indvdlBsnmCstmrCd;
	
	private String userCd; 	//유저코드
	private UserVO userVO;
	
	private String userNm;	//유저이름
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date   processDe;	//처리날짜
	
	//PRESENTN_PAPERS 테이블 속성추가
	private String presentnPapersNo;	//제출서류번호
	private String papersPresentnDe;	//서류제출일자
	private String atchmnflNo;			//첨부파일번호
	private String preProSttus;			//서류처리상태
	private String papersIemCd;			//서류항목코드
	
	//ENTRY 테이블 속성 추가
	private String entrManageNo;        //통관 관리 번호

}
