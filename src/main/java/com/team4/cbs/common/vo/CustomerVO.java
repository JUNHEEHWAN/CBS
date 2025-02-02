package com.team4.cbs.common.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team4.cbs.cstbrkr.vo.PresentnPapersVO;

import lombok.Data;

@Data
public class CustomerVO {
	private String cstmrCd; 		//고객_코드 
	private String entrprsNm; 		//기업_명
	private String bizrno; 			//사업자_등록_번호
	private String ectmrk; 			//통관고유부호
	private String mfrcRealmSe; 	//주력_분야_구분(공통코드)
	private String bsnAt; 			//영업_여부 (T: 영업중, F:폐업)
	private String crmnlHist; 		//범죄_이력 (T: 있음, F: 없음)
	private String taxNpymHist; 	//세금_체납_이력 (T: 있음, F: 없음)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private String processSttus; 	//처리_상태 (공통코드)
	private String reprsntAdres; 	//대표주소
	private String reprsntDetailAdres; 	//상세주소
	private String reprsntTelno; 	//대표전화번호
	private String reprsntEmail; 	//대표이메일
	private String charger;			//담당자
	private String scaleSe;			//규모 구분
	private Date   processDe;		//처리 날짜
	
	//1명의 고객 : 여러건의 의뢰
	//CUSTOMER : PRESENTN_PAPERS = 1 : N
	private List<PresentnPapersVO> presentnPapersVOList;
}
	