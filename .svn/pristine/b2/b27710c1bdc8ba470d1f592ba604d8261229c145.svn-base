package com.team4.cbs.trnsprt.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;

import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ShipDiaryDetailVO {
	
	private String shipNm;		//선박명
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date cbstrDate;		//건조일자
	private int grtg;			//총톤수
	private int shipLt;			//선박길이
	private String clsgn;		//호출부호
	
	List<ContainerVO> SCList = new ArrayList<ContainerVO>();
}
