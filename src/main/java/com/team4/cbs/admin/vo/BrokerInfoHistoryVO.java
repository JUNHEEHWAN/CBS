package com.team4.cbs.admin.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BrokerInfoHistoryVO {
	
	private String histNo;		// 이력 번호
	private String cstbrkrCd;	// 관세사 코드
	private int ver;			// 버전
	private Date qualfAcqsDe;	// 자격 취득 일
	private String lastAcdmcr;	// 최종 학력
	private int confmAt;		// 승인 여부
	private int qualfNo;		// 자격 번호
	private Date changeDe;		// 변경 일자
	
}
