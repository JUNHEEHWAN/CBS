package com.team4.cbs.pbsvnt.admin.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.common.vo.CustomerVO;
import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.cstbrkr.vo.EntryVO;
import com.team4.cbs.pbsvnt.admin.mapper.SvntAdminMapper;
import com.team4.cbs.pbsvnt.admin.service.SvntAdminService;
import com.team4.cbs.pbsvnt.admin.vo.ExportLicenseVO;
import com.team4.cbs.pbsvnt.admin.vo.OneEntryDetailVO;
import com.team4.cbs.pbsvnt.admin.vo.WarehouseChitVO;
import com.team4.cbs.pbsvnt.bounded.vo.BoundedWarehouseVO;
import com.team4.cbs.pbsvnt.bounded.vo.UseBoundedWarehouseVO;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineRequestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SvntAdminServiceImpl implements SvntAdminService {
	
	@Autowired
	SvntAdminMapper svntAdminMapper;
	
	@Override
	public int updSttus(CustomerVO customerVO) { // 고객 처리 상태 변경
		if(customerVO.getProcessSttus().equals("접수")) {
			customerVO.setProcessSttus("CPS2");
		}
		if(customerVO.getProcessSttus().equals("승인")) {
			customerVO.setProcessSttus("CPS3");
		}
		if(customerVO.getProcessSttus().equals("비승인")) {
			customerVO.setProcessSttus("CPS4");
		}
		return this.svntAdminMapper.updSttus(customerVO);
	}
	
	@Override
	public CustomerVO oneCustomer(CustomerVO cstmrCd) { // 고객 코드 클릭시 고객 상세
		return this.svntAdminMapper.oneCustomer(cstmrCd);
	}

	@Override
	public int cusChkRandUpd(CustomerVO customerVO) { // 고객 검사 랜덤값 넣기 (영업 여부, 범죄 여부, 세금 체납 여부)
		// 랜덤 테스트 필요할 때
//		Random random = new Random();
//        String[] tfValues = {"T", "F"};
//        
//        String bsnAtValue = tfValues[random.nextInt(2)];
//        customerVO.setBsnAt(bsnAtValue);
//
//        String crmnlHistValue = tfValues[random.nextInt(2)];
//        customerVO.setCrmnlHist(crmnlHistValue);
//
//        String taxNpymHistValue = tfValues[random.nextInt(2)];
//        customerVO.setTaxNpymHist(taxNpymHistValue);
		
		customerVO.setBsnAt("T");
		customerVO.setCrmnlHist("F");
		customerVO.setTaxNpymHist("F");
		
		return this.svntAdminMapper.cusChkRandUpd(customerVO);
	}

	@Override
	public CustomerVO oneCusChk(CustomerVO customerVO) { // 고객 검사 값 가져오기 (영업 여부, 범죄 여부, 세금 체납 여부)
		return this.svntAdminMapper.oneCusChk(customerVO); 
	}
	
	@Override
	public List<EntryVO> entryList(Map<String, Object> map) { // 통관 접수 후 심사 전 배정 목록
		return this.svntAdminMapper.entryList(map);
	}

	@Override
	public int updPbsvntCd(Map<String, Object> map) { // 통관 배정 공무원 update
		return this.svntAdminMapper.updPbsvntCd(map);
	}

	@Override
	public int getTotalEntryList() { // 통관 접수 페이징 처리 위한 총 게시글 수 
		return this.svntAdminMapper.getTotalEntryList();
	}

	@Override
	public List<EntryProcessStatusVO> judgeList(Map<String, Object> map) { // 통관 심사 목록
		return this.svntAdminMapper.judgeList(map);
	}

	@Override
	public int getTotalJudgeList() { // 통관 심사 페이징 처리 위한 총 게시글 수 
		return this.svntAdminMapper.getTotalJudgeList();
	}

	@Override
	public OneEntryDetailVO oneEntryDetail(String entrManageNo) { // 통관 번호 클릭시 상세 정보
		return this.svntAdminMapper.oneEntryDetail(entrManageNo);
	}

	@Override
	public List<OneEntryDetailVO> tooltipInfo(String entrManageNo) {
		return this.svntAdminMapper.tooltipInfo(entrManageNo);
	}

	@Override
	public int eps2upd(Map<String, Object> map) { // 통관 접수시 EPS1 -> EPS2
		return this.svntAdminMapper.eps2upd(map);
	}

	@Override
	public List<EntryThingVO> entryDetailList(String entrManageNo) { // 통관 물품정보 검색 리스트 -동현-
		return this.svntAdminMapper.entryDetailList(entrManageNo);
	}

	@Override
	public int updWarehouse(UseBoundedWarehouseVO useBoundedWarehouseVO) { // EPS2 상태에서 운송(입고) 신청시 창고 update
		
		// 창고의 어느 구역에 들어갈지는 랜덤하게
		final String[] ZONES = {
			"A1", "A2", "A3", "A4", "A5", "A6", "A7",
			"B1", "B2", "B3", "B4", "B5",
			"C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8",
			"D1", "D2", "D3", "D4", "D5", "D6"
		};
		
		Random random = new Random();
		int randomIdx = random.nextInt(ZONES.length); // ZONES 길이만큼 돌리면서 랜덤 인덱스 하나 뽑기
		String bndwasCd = ZONES[randomIdx];			  // 랜덤으로 뽑은 인덱스 값 추출
		
		useBoundedWarehouseVO.setBndwasCd(bndwasCd);  // 랜덤한 보세창고 코드 세팅
		
		log.info("[ServiceImpl]updWarehouse()->useBoundedWarehouseVO: " + useBoundedWarehouseVO);
		
		return this.svntAdminMapper.updWarehouse(useBoundedWarehouseVO);
	}

	@Override
	public int eps3upd(EntryProcessStatusVO entryProcessStatusVO) { // 운송 요청시 EPS2 -> EPS3
		return this.svntAdminMapper.eps3upd(entryProcessStatusVO);
	}

	@Override
	public BoundedWarehouseVO getWarehouseInfo(BoundedWarehouseVO boundedWarehouseVO) { // 자동 배정된 창고 구역, 번호 불러오기
		return this.svntAdminMapper.getWarehouseInfo(boundedWarehouseVO);
	}

	@Override
	public int getTotalCstCheckList(Map<String, Object> map) { // 고객 검사 목록
		return this.svntAdminMapper.getTotalCstCheckList(map);
	}

	@Override
	public List<CustomerVO> cstCheck(Map<String, Object> map) { // 고객 검사 페이징 처리 위한 총 게시글 수
		return this.svntAdminMapper.cstCheck(map);
	}

	@Override
	public String getQrantRequestCd() { // 검역 요청 코드 +1 값 가져오기
		return this.svntAdminMapper.getQrantRequestCd();
	}

	@Override
	public QuarantineRequestVO insQuarRequest(QuarantineRequestVO quarantineRequestVO) { // 검역 요청 테이블 insert
		log.info("quarantineRequestVO->" + quarantineRequestVO);
		return this.svntAdminMapper.insQuarRequest(quarantineRequestVO);
	}

	@Override
	public int eps5upd(EntryProcessStatusVO entryProcessStatusVO) { // 검역 요청시
		return this.svntAdminMapper.eps5upd(entryProcessStatusVO);
	}

	@Override
	public int eps10upd(EntryProcessStatusVO entryProcessStatusVO) { // 출고 요청시
		// TODO Auto-generated method stub
		return this.svntAdminMapper.eps10upd(entryProcessStatusVO);
	}
	
	@Override
	public int eps12upd(EntryProcessStatusVO entryProcessStatusVO) { // 수출입 승인시
		return this.svntAdminMapper.eps12upd(entryProcessStatusVO);
	}
	
	@Override
	public int insExportLicense(ExportLicenseVO exportLicenseVO) { // 승인기관, 유효기간, 승인번호, 날짜, 승인자 insert
		return this.svntAdminMapper.insExportLicense(exportLicenseVO);
	}

	@Override
	public ExportLicenseVO getExportLicense(ExportLicenseVO exportLicenseVO) { // 수출입 승인서 값 select -> 리스트 아닌 것
		return this.svntAdminMapper.getExportLicense(exportLicenseVO);
	}

	@Override
	public List<ExportLicenseVO> getExportLicense2(ExportLicenseVO exportLicenseVO) { // 수출입 승인서 값 select -> 리스트인 것
		return this.svntAdminMapper.getExportLicense2(exportLicenseVO);
	}

	@Override
	public ExportLicenseVO getExportLicense3(ExportLicenseVO exportLicenseVO) { // 수출입 승인서 값 select -> section3
		return this.svntAdminMapper.getExportLicense3(exportLicenseVO);
	}

	@Override
	public WarehouseChitVO warehouseChit(WarehouseChitVO warehouseChitVO) { // 보세창고전표
		return this.svntAdminMapper.warehouseChit(warehouseChitVO);
	}

	@Override
	public int quarPassEps8upd(EntryProcessStatusVO entryProcessStatusVO) {
		return this.svntAdminMapper.quarPassEps8upd(entryProcessStatusVO);
	}

	/*
	@Override
	public List<QuarantineDetailVO> pbQuarList() { // 검역 결과 조회
		return this.svntAdminMapper.pbQuarList();
	}

	@Override
	public List<ErrorsInDeclarationVO> error() { // 신고 내역 조회
		return this.svntAdminMapper.error();
	}

	@Override
	public QuarantineDetailVO oneQurantDet(QuarantineDetailVO quarntineDetailVO) { // 검역 상세 조회
		return this.svntAdminMapper.oneQurantDet(quarntineDetailVO); 
	}

	@Override
	public ErrorsInDeclarationVO oneErorDet(ErrorsInDeclarationVO erorVO) { // 신고 상세 조회
		return this.svntAdminMapper.oneErorDet(erorVO);
	}
	*/
//	@Override
//	public List<EntryVO> myList(String pbsvntCd) { // 서류 심사 내 담당 목록
//		return this.svntAdminMapper.myList(pbsvntCd);
//	}

//	@Override
//	public List<EntryVO> allList() { // 서류 심사 접수 대기 목록
//		// TODO Auto-generated method stub
//		return this.svntAdminMapper.allList();
//	}
}
