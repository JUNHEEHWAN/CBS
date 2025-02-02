package com.team4.cbs.cstbrkr.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.common.vo.AttachmentFileVO;
import com.team4.cbs.common.vo.ChargeCustomerVO;
import com.team4.cbs.common.vo.CustomerVO;
import com.team4.cbs.common.vo.CustomsBrokerVO;
import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.cstbrkr.vo.EntryProcessListVO;
import com.team4.cbs.cstbrkr.vo.EntryTaxVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.cstbrkr.vo.EntryVO;
import com.team4.cbs.cstbrkr.vo.GoodsVO;
import com.team4.cbs.cstbrkr.vo.ImportExportCertificateVO;
import com.team4.cbs.cstbrkr.vo.PresentnPapersVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryVO;

public interface CstbrkrService {

	// 담당고객 목록
	public List<ChargeCustomerVO> chargeCustomerList(String id);

	public List<ChargeCustomerVO> chargeCustomerList(Map<String, Object> map);

	// 페이징 처리를 위해 전체 행갯수 가져오기 (담당고객관리)
	public int getTotal(Map<String, Object> map);

	// 담당고객 상세
	public ChargeCustomerVO chargeCustomerDetail(ChargeCustomerVO cstmrCd);

	// 법인고객 등록
	public int legalChargeCustomerInsert(ChargeCustomerVO chargeCustomerVO);

	// 개인고객 등록
	public int indivChargeCustomerInsert(ChargeCustomerVO chargeCustomerVO);

	// 법인고객 수정
	public int legalChargeCustomerUpdate(ChargeCustomerVO chargeCustomerVO);

	// 개인고객 수정
	public int indivChargeCustomerUpdate(ChargeCustomerVO chargeCustomerVO);

	// 담당고객 삭제
	public int chargeCustomerDelete(ChargeCustomerVO chargeCustomerVO);

	// 삭제 전 통관 테이블에서 고객 코드 체크
	public int checkCstmrCd(String cstmrCd);

	/****************************************************************/

	// 의뢰 목록
	public List<PresentnPapersVO> presentnPapersList();

	// 의뢰 목록 페이지 검색 조건을 통해 불러오는 메서드
	public List<PresentnPapersVO> presentnPapersConditionSearchList(Map<String, Object> conditionDatas);

	// 의뢰 상세정보
	public CustomerVO presentnPapersDetail(PresentnPapersVO presentnPapersNo);

	// 상세조회 해당 의뢰 첨부파일 다운로드를 위한 디비에 저장된 파일명 가져오기
	public AttachmentFileVO getFileName(AttachmentFileVO attachmentFileVO);

	// 고객 검사요청
	public int customerRequest(CustomerVO customerVO);

	/****************************************************************/

	// 고객검사 승인 된 목록만 가져오는 메서드 Select
	public List<ChargeCustomerVO> entryApplyListSelect(String cstbrkrCd);

	// 고객검사 승인 된 목록 조건 검색 메서드 Select
	public List<ChargeCustomerVO> entryApplyListSelectConditionSearch(Map<String, Object> conditionData);

	// 고객검사 승인된 목록에서 진행버튼을 클릭했을 때, 임시저장 된 값을 가져오는 메서드
	public Map<String, Object> progressEntryInfo(String presentnPapersNo);

	// 통관신청 관세사 이름 불러오기
	public UserVO selectCstbkNm(CustomsBrokerVO customsBrokerVO);

	// 통관신청 수입자 코드 불러와서 수출자 정보 보내주기
	public CustomerVO entryImportInfo(CustomerVO customerVO);

	// 통관신청 수출자 코드 불러와서 수출자 정보 보내주기
	public CustomerVO entryExportInfo(CustomerVO customerVO);

	// 수출입 신고 통관 페이지 통관테이블에 삽입
	public int insertEntry(List<Map<String, Object>> dataList);

	// 통관관리번호 및 고객번호 요청
	public EntryVO selectEntryNo();

	// 주력상품 리스트 검색
	public List<GoodsVO> goodsSearch(String searchText);

	// 수출입 신고 통관 물품 여러건 삽입
	public int insertEntryThings(List<EntryThingVO> entryThingVOList);

	// 선박일정 불러오는 메소드
	public List<ShipDiaryVO> shipDiarySearch();

	// 통관물품 통관신청시 처리상태 insert
	public int entryProcessStatusInsert(EntryProcessStatusVO entryProcessStatusVO);

	// 통관 목록 페이지 리스트 불러오는 메서드 Select
	public List<EntryProcessListVO> entryProcessList();

	// 통관 목록 페이지 검색 조건을 통해 불러오는 메서드 Select
	public List<EntryProcessListVO> entryProcessConditionSearchList(Map<String, Object> conditionData);

	// 통관대행료 계산서 정보 불러오는 메서드 Select
	public List<Map<String, Object>> customsClearanceAgencyFeeTaxInvoiceInfo(String entrManageNo);

	/***************************************************************************/

	// 아이디 찾기
	public UserVO selectId(String username);

	// 비빌번호 찾기
	public String getPwd(String userId);

	// 비밀번호 검사
	public boolean matches(String checkPwd, String pwd);

	// 마이페이지 상세
	public List<UserVO> userDet(String username);

	// 비밀번호 제외한 개인정보 업데이트
	public int perUpd(UserVO userVo);

	// 비밀번호 포함한 개인정보 업데이트
	public int perUpd2(UserVO userVo);

	// 프로필 사진 업데이트
	public int profileUpd(CustomsBrokerVO customsBrokerVO);

	// 수입 신고서
	public List<ImportExportCertificateVO> ImportExportCertificate(String entrManageNo);

	// 수입물품 데이터
	public List<EntryThingVO> entryThingData(String entrManageNo);

	// 수입신고서 세금 데이터
	public List<EntryTaxVO> entryTaxData(String entrManageNo);

}