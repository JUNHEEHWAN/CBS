package com.team4.cbs.pbsvnt.admin.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class WarehouseChitVO {
	private String entrManageNo;	// 통관관리번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date wrhousngDe;		// 입고일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date dlivyDe;			// 출고일
	private int chcy;				// 보관일수
	private double totWt;			// 총 중량
	private double aprpc;			// 감정가
	private double cstms;			// 관세
}
