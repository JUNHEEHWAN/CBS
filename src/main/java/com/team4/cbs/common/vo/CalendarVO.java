package com.team4.cbs.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CalendarVO {
	
	private int caleCd;						// 캘린더 코드
	private String userCd;					// 사용자 코드
	private String caleDateTimeStart;		// 캘린더 시작
	private String caleDateTimeEnd;			// 캘린더 끝
	private String caleDateOldTimeStart;	// 캘린더 백업 시작
	private String caleDateOldTimeEnd;		// 캘린더 백업 끝
	private String caleCn;					// 캘린더 내용
	
}
