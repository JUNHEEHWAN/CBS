package com.team4.cbs.main.declaration.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TransportChitVO {
	
	private String userCd;          	// 신고자코드
	private String userNm;          	// 신고자명
	private String telno;				// 전화번호
	private String entrManageNo;    	// 통관관리번호
	private String vhcleDiaryCd;    	// 차량일지코드
	private String strtPnt;         	// 보세운송 출발지
	private String arvlPnt;         	// 보세운송 도착지
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date strtTime;        		// 출발 일자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date arvlTime;				// 도착 일자

	private String entrprsNm; 			// 기업_명
	private String bizrno; 				// 사업자_등록_번호
	private String reprsntAdres; 		// 대표주소
	private String charger;				// 담당자
	
	List<EntryThingVO> entryThingList; 	// 통관별 물품리스트
}
