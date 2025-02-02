package com.team4.cbs.admin.vo;

import lombok.Data;

@Data
public class PublicServantVO {
	private String pbsvntCd;//공무원 코드
	private String pbsvntJobCd;// 공무원 업무코드 (1.행정  2.검역 3.보세창고)

}
