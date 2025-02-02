package com.team4.cbs.pbsvnt.admin.mapper;

import java.util.List;
import java.util.Map;

import com.team4.cbs.common.vo.CustomerVO;
import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.cstbrkr.vo.EntryVO;
import com.team4.cbs.pbsvnt.admin.vo.ExportLicenseVO;
import com.team4.cbs.pbsvnt.admin.vo.OneEntryDetailVO;
import com.team4.cbs.pbsvnt.admin.vo.WarehouseChitVO;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedWarehouseVO;
import com.team4.cbs.pbsvnt.bounded.vo.UseBoundedWarehouseVO;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineRequestVO;

public interface SvntAdminMapper {
	public int updSttus(CustomerVO customerVO);			    	 						// 고객 처리 상태 변경
	public CustomerVO oneCustomer(CustomerVO cstmrCd); 			 						// 고객 코드 클릭시 고객 상세
	public int cusChkRandUpd(CustomerVO customerVO); 	 								// 고객 검사 랜덤값 넣기 (영업 여부, 범죄 여부, 세금 체납 여부)
	public CustomerVO oneCusChk(CustomerVO customerVO);			 						// 고객 검사 값 가져오기 (영업 여부, 범죄 여부, 세금 체납 여부)
	public List<EntryVO> entryList(Map<String, Object> map);							// 통관 접수 목록
	public int updPbsvntCd(Map<String, Object> map); 									// 통관 접수 공무원 update
	public int getTotalEntryList();														// 통관 접수 페이징 처리 위한 총 게시글 수 
	public List<EntryProcessStatusVO> judgeList(Map<String, Object> map); 				// 통관 심사 목록
	public int getTotalJudgeList();														// 통관 심사 페이징 처리 위한 총 게시글 수 
	public OneEntryDetailVO oneEntryDetail(String entrManageNo);						// 통관 번호 클릭시 상세 정보
	public List<OneEntryDetailVO> tooltipInfo(String entrManageNo);						// 통관 번호 클릭시 툴팁 정보
	public int eps2upd(Map<String, Object> map);										// 통관 접수시 EPS1 -> EPS2
	public List<EntryThingVO> entryDetailList(String entrManageNo);						// 통관 물품정보 검색 리스트 -동현-
	public int updWarehouse(UseBoundedWarehouseVO useBoundedWarehouseVO);				// EPS2 상태에서 운송(입고) 신청시 창고 update
	public int eps3upd(EntryProcessStatusVO entryProcessStatusVO);						// 운송 요청시 EPS2 -> EPS3
	public BoundedWarehouseVO getWarehouseInfo(BoundedWarehouseVO boundedWarehouseVO);  // 자동 배정된 창고 구역, 번호 불러오기
	public List<CustomerVO> cstCheck(Map<String, Object> map);							// 고객 검사 목록
	public int getTotalCstCheckList(Map<String, Object> map);													// 고객 검사 페이징 처리 위한 총 게시글 수
	public String getQrantRequestCd();													// 검역 요청 코드 +1 값 가져오기
	public QuarantineRequestVO insQuarRequest(QuarantineRequestVO quarantineRequestVO);	// 검역 요청 테이블 insert
	public int eps5upd(EntryProcessStatusVO entryProcessStatusVO);						// 검역 요청시 EPS5
	public int eps10upd(EntryProcessStatusVO entryProcessStatusVO);						// 출고 요청시
	public int eps12upd(EntryProcessStatusVO entryProcessStatusVO);						// 수출입 승인시
	public int insExportLicense(ExportLicenseVO exportLicenseVO);						// 승인기관, 유효기간, 승인번호, 날짜, 승인자 insert
	public ExportLicenseVO getExportLicense(ExportLicenseVO exportLicenseVO);			// 수출입 승인서 값 select -> 리스트 아닌 것
	public List<ExportLicenseVO> getExportLicense2(ExportLicenseVO exportLicenseVO);	// 수출입 승인서 값 select -> 리스트인 것
	public ExportLicenseVO getExportLicense3(ExportLicenseVO exportLicenseVO);			// 수출입 승인서 값 select -> section3
	public WarehouseChitVO warehouseChit(WarehouseChitVO warehouseChitVO);				// 보세창고전표
	public int quarPassEps8upd(EntryProcessStatusVO entryProcessStatusVO);				// 검역 승인시
	
//	public List<EntryVO> myList(String pbsvntCd);   			 // 서류 심사 내 담당 목록
//	public List<EntryVO> allList();								 // 서류 심사 접수 대기 목록
//	public List<QuarantineDetailVO> pbQuarList();    			 // 검역 결과 조회
//	public List<ErrorsInDeclarationVO> error();		 			 // 신고 내역 조회
//	public QuarantineDetailVO oneQurantDet(QuarantineDetailVO quarntineDetailVO); // 검역 상세 조회
//	public ErrorsInDeclarationVO oneErorDet(ErrorsInDeclarationVO erorVO); 		  // 신고 상세 조회
}
