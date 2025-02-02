package com.team4.cbs.pbsvnt.bounded.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class UseBoundedWarehouseVO {
	private String bndwasCd;
	private String entrManageNo;
	private int goodsNo;
	private String cstmrCd;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") // ajax - 날짜(Date) 받아오기 https://kimfk567.tistory.com/34
	private Date wrhousngDe;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date dlivyDe;
	
	private String hsCd;
}
