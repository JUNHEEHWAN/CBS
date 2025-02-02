package com.team4.cbs.common.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CustomsBrokerVO {
	private String cstbrkrCd; //관세사_코드

	@DateTimeFormat(pattern = "yyyy-mm-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date qualfAcqsDe;//자격_취득_일자
	private String lastAcdmcr;//최종_학력
	private String confmAt;//승인_여부 (T: 승인, F: 미승인)
	private int qualfNo;//자격_번호
	private String profileFile;//프로필_URL

}
