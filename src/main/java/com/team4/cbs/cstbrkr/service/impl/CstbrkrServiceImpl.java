package com.team4.cbs.cstbrkr.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team4.cbs.common.vo.AttachmentFileVO;
import com.team4.cbs.common.vo.ChargeCustomerVO;
import com.team4.cbs.common.vo.CustomerVO;
import com.team4.cbs.common.vo.CustomsBrokerVO;
import com.team4.cbs.common.vo.EntryProcessStatusVO;
import com.team4.cbs.common.vo.UserVO;
import com.team4.cbs.cstbrkr.mapper.CstbrkrMapper;
import com.team4.cbs.cstbrkr.service.CstbrkrService;
import com.team4.cbs.cstbrkr.vo.EntryProcessListVO;
import com.team4.cbs.cstbrkr.vo.EntryTaxVO;
import com.team4.cbs.cstbrkr.vo.EntryThingVO;
import com.team4.cbs.cstbrkr.vo.EntryVO;
import com.team4.cbs.cstbrkr.vo.GoodsVO;
import com.team4.cbs.cstbrkr.vo.ImportExportCertificateVO;
import com.team4.cbs.cstbrkr.vo.PresentnPapersVO;
import com.team4.cbs.pbsvnt.quar.vo.AnimalAndPlantsThingVO;
import com.team4.cbs.pbsvnt.quar.vo.GeneralThingVO;
import com.team4.cbs.trnsprt.vo.ContainerVO;
import com.team4.cbs.trnsprt.vo.ShipDiaryVO;
import com.team4.cbs.trnsprt.vo.ShipOperateContainerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CstbrkrServiceImpl implements CstbrkrService {

   @Autowired
   CstbrkrMapper cstbrkrMapper;

   // 담당고객 목록
   @Override
   public List<ChargeCustomerVO> chargeCustomerList(String id) {
      return this.cstbrkrMapper.chargeCustomerList(id);
   }

   @Override
   public List<ChargeCustomerVO> chargeCustomerList(Map<String, Object> map) {
      return this.cstbrkrMapper.chargeCustomerList(map);
   }

   // 페이징 처리를 위해 전체 행갯수 가져오기 (담당고객관리)
   @Override
   public int getTotal(Map<String, Object> map) {
      return cstbrkrMapper.getTotal(map);
   }

   // 담당고객 상세
   @Override
   public ChargeCustomerVO chargeCustomerDetail(ChargeCustomerVO cstmrCd) {
      return this.cstbrkrMapper.chargeCustomerDetail(cstmrCd);
   }

   // 법인고객 등록
   @Override
   public int legalChargeCustomerInsert(ChargeCustomerVO chargeCustomerVO) {
      return this.cstbrkrMapper.legalChargeCustomerInsert(chargeCustomerVO);
   }

   // 개인고객 등록
   @Override
   public int indivChargeCustomerInsert(ChargeCustomerVO chargeCustomerVO) {
      return this.cstbrkrMapper.indivChargeCustomerInsert(chargeCustomerVO);
   }

   // 법인고객 수정
   @Transactional
   @Override
   public int legalChargeCustomerUpdate(ChargeCustomerVO chargeCustomerVO) {
      int result = this.cstbrkrMapper.legalChargeCustomerUpdate(chargeCustomerVO);
      result += this.cstbrkrMapper.legalPersonUpdate(chargeCustomerVO);
      return result;
   }

   // 개인고객 수정
   @Override
   public int indivChargeCustomerUpdate(ChargeCustomerVO chargeCustomerVO) {
      return this.cstbrkrMapper.indivChargeCustomerUpdate(chargeCustomerVO);
   }

   // 담당고객 삭제
   @Override
   public int chargeCustomerDelete(ChargeCustomerVO chargeCustomerVO) {
      return this.cstbrkrMapper.chargeCustomerDelete(chargeCustomerVO);
   }

   // 삭제 전 통관 테이블에서 고객 코드 체크
   @Override
   public int checkCstmrCd(String cstmrCd) {
      return this.cstbrkrMapper.checkCstmrCd(cstmrCd);
   }

   /*********************************************************************/

   // 의뢰 목록
   @Override
   public List<PresentnPapersVO> presentnPapersList() {
      return this.cstbrkrMapper.presentnPapersList();
   }

   // 의뢰 목록 페이지 검색 조건을 통해 불러오는 메서드
   @Override
   public List<PresentnPapersVO> presentnPapersConditionSearchList(Map<String, Object> conditionDatas) {
      return this.cstbrkrMapper.presentnPapersConditionSearchList(conditionDatas);
   }

   // 의뢰 상세 정보
   @Override
   public CustomerVO presentnPapersDetail(PresentnPapersVO presentnPapersNo) {
      return this.cstbrkrMapper.presentnPapersDetail(presentnPapersNo);
   }

   // 상세조회 해당 의뢰 첨부파일 다운로드를 위한 디비에 저장된 파일명 가져오기
   @Override
   public AttachmentFileVO getFileName(AttachmentFileVO atchmnflNo) {
      return cstbrkrMapper.getFileName(atchmnflNo);

   }

   // 고객 검사 요청
   @Override
   public int customerRequest(CustomerVO customerVO) {
      return this.cstbrkrMapper.customerRequest(customerVO);
   }

   /*********************************************************************/

   // 고객검사 승인 된 목록만 가져오는 메서드 Select
   @Override
   public List<ChargeCustomerVO> entryApplyListSelect(String cstbrkrCd) {
      return this.cstbrkrMapper.entryApplyListSelect(cstbrkrCd);
   }

   // 고객검사 승인 된 목록 조건 검색 메서드 Select
   @Override
   public List<ChargeCustomerVO> entryApplyListSelectConditionSearch(Map<String, Object> conditionData) {
      return this.cstbrkrMapper.entryApplyListSelectConditionSearch(conditionData);
   }

   // 고객검사 승인된 목록에서 진행버튼을 클릭했을 때, 임시저장 된 값을 가져오는 메서드
   @Override
   @Transactional
   public Map<String, Object> progressEntryInfo(String presentnPapersNo) {
      EntryVO entryVO = new EntryVO();
      ShipOperateContainerVO shipOperateContainerVO = new ShipOperateContainerVO();
      ContainerVO containerVO = new ContainerVO();
      Map<String, Object> resultMap = new HashMap<String, Object>();

      String entrManageNo = "";
      entrManageNo = this.cstbrkrMapper.getEntryManageNo(presentnPapersNo);
      log.debug("제출서류로 통관번호 찾기 : {}", entrManageNo);

      entrManageNo = this.cstbrkrMapper.getMiniEntryInfo(entrManageNo);
      log.debug("통관번호로 통관번호 찾기 : {}", entrManageNo);

      String entryThingEmgn = this.cstbrkrMapper.searchEntryThing(entrManageNo);
      log.debug("통관물품 찾기 : {}", entryThingEmgn);

      if (entryThingEmgn == null) {
         shipOperateContainerVO = this.cstbrkrMapper.progressShipOperationContainer(entrManageNo);
         log.debug("선박운행컨테이너 정보 불러오기 : {}", shipOperateContainerVO);

         entryVO = this.cstbrkrMapper.progressEntryInfo(entrManageNo);
         log.debug("통관정보 불러오기 : {}", entryVO);

         String cntanrInnb = shipOperateContainerVO.getCntanrInnb();
         log.debug("선박운행컨테이너 정보에서 선택된 컨테이너 고유 번호 불러오기 : {}", cntanrInnb);

         containerVO = this.cstbrkrMapper.progressContainerInfo(cntanrInnb);
         log.debug("컨테이너 정보 불러오기 : {}", containerVO);

         resultMap.put("shipOperateContainerVO", shipOperateContainerVO);
         resultMap.put("entryVO", entryVO);
         resultMap.put("containerVO", containerVO);

         return resultMap;
      } else {
         return null;
      }
   }

   // 통관신청 관세사 이름 불러오기
   @Override
   public UserVO selectCstbkNm(CustomsBrokerVO cstbrkrCd) {
      return this.cstbrkrMapper.selectCstbkNm(cstbrkrCd);
   }

   // 통관신청 수입자 코드 불러와서 수출자 정보 보내주기
   @Override
   public CustomerVO entryImportInfo(CustomerVO customerVO) {
      return this.cstbrkrMapper.entryImportInfo(customerVO);
   }

   // 통관신청 수출자 코드 불러와서 수출자 정보 보내주기
   @Override
   public CustomerVO entryExportInfo(CustomerVO customerVO) {
      return this.cstbrkrMapper.entryExportInfo(customerVO);
   }

   // 수출입 신고 통관 페이지 통관테이블에 삽입
   @Override
   @Transactional
   public int insertEntry(List<Map<String, Object>> dataList) {
      EntryVO entryVO = new EntryVO();
      Map<String, Object> entryVOList = dataList.get(0); // 첫 번째 객체

      entryVO.setCstbrkrCd((String) entryVOList.get("cstbrkrCd"));
      entryVO.setCstmrCd((String) entryVOList.get("cstmrCd"));
      entryVO.setClient((String) entryVOList.get("client"));
      entryVO.setNotifyInfo((String) entryVOList.get("notifyInfo"));
      entryVO.setEntrSe((String) entryVOList.get("entrSe"));
      entryVO.setExpterCmpnm((String) entryVOList.get("expterCmpnm"));
      entryVO.setExpterAdres((String) entryVOList.get("expterAdres"));
      entryVO.setExpterTelno((String) entryVOList.get("expterTelno"));
      entryVO.setExpterCharger((String) entryVOList.get("expterCharger"));
      entryVO.setImprCmpnm((String) entryVOList.get("imprCmpnm"));
      entryVO.setImprAdres((String) entryVOList.get("imprAdres"));
      entryVO.setImprTelno((String) entryVOList.get("imprTelno"));
      entryVO.setImprCharger((String) entryVOList.get("imprCharger"));
      entryVO.setManctmKwa((String) entryVOList.get("manctmKwa"));
      entryVO.setManctmKwaCharger((String) entryVOList.get("manctmKwaCharger"));
      entryVO.setTrnsprtStle((String) entryVOList.get("trnsprtStle"));
      entryVO.setWaybilNo((String) entryVOList.get("waybilNo"));
      entryVO.setStartPrt((String) entryVOList.get("startPrt"));
      entryVO.setArvlPrt((String) entryVOList.get("arvlPrt"));
      entryVO.setShipNm((String) entryVOList.get("shipNm"));
      entryVO.setCoudes((String) entryVOList.get("coudes"));

      SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

      try {
         Date shipStartDe = sdfDateTime.parse((String) entryVOList.get("shipStartDe"));
         entryVO.setShipStartDe(shipStartDe);
      } catch (Exception e) {
         // 날짜 형식이 올바르지 않을 경우 예외 처리
         e.printStackTrace();
      }

      try {
         Date shipEndDe = sdfDateTime.parse((String) entryVOList.get("shipEndDe"));
         entryVO.setShipEndDe(shipEndDe);
      } catch (Exception e) {
         // 날짜 형식이 올바르지 않을 경우 예외 처리
         e.printStackTrace();
      }

      // insert
      int result = this.cstbrkrMapper.insertEntry(entryVO);
      log.debug("임시저장 눌러서 통관 한 건 만들기 만든 결과 건 수 : {}", result);

      // select
      String emgn = this.cstbrkrMapper.insertAfterSelectEntryNo();
      log.debug("임시저장 눌러서 통관 한 건 만든 통관번호 바로 불러온 통관번호 : {}", emgn);

      Map<String, Object> presentnPapersNoMap = dataList.get(1); // 두 번째 객체
      String presentnPapersNo = (String) presentnPapersNoMap.get("presentnPapersNo");

      PresentnPapersVO presentnPapersVO = new PresentnPapersVO();
      presentnPapersVO.setPresentnPapersNo(presentnPapersNo);
      presentnPapersVO.setEntrManageNo(emgn);

      Map<String, Object> shipOperationContainerMap = dataList.get(2); // 세 번째 객체
      shipOperationContainerMap.put("entrManageNo", emgn);

      // insert
      result += this.cstbrkrMapper.shipOperationContainer(shipOperationContainerMap);

      // update
      result += this.cstbrkrMapper.updatePresentPapers(presentnPapersVO);
      log.debug("임시저장 눌러서 만든 통관번호를 제출서류 테이블에 업데이트한 건 포함 된 수 3가 나와야함 : {}", result);

      return result;
   }

   // 통관관리번호 및 고객번호 요청
   @Override
   public EntryVO selectEntryNo() {
      return this.cstbrkrMapper.selectEntryNo();
   }

   // 주력상품 리스트 검색
   @Override
   public List<GoodsVO> goodsSearch(String searchText) {
      return this.cstbrkrMapper.goodsSearch(searchText);
   }

   // 수출입 신고 통관 물품 여러건 삽입
   @Override
   @Transactional(rollbackFor = { Exception.class })
   public int insertEntryThings(List<EntryThingVO> entryThingVOList) {
      log.debug("serviceImpl - insertEntryThings - 실행");
      log.debug("serviceImpl - insertEntryThings - 받아온 값 : {}", entryThingVOList);

      int entryThingInsert = 0; // 통관 물품 테이블 insert 건 수
      int generalThingInsert = 0; // 일반 물품 테이블 insert 건 수
      int animalAndPlantsThingInsert = 0; // 동식물 물품 테이블 insert 건 수
      int entryPapersInsert = 0; // 통관 서류 테이블 insert 건 수
      int entryTaxInsert = 0; // 통관 세액 테이블 insert 건 수
      int calculationTaxInsert = 0; // 산정 세액 테이블 insert 건 수
      long hsCodeAmount = 0; // 통관 건에 대한 통관물품들의 총 과세금액 합
      long totalTaxAmount = 0; // 통관 건의 통관 물품들의 총 금액 합
      double calcAmount = totalTaxAmount; // 통관 건의 세제 후 산정 금액

      /** 통관이 신청되어 통관 서류 테이블에도 insert */
      String entryPapersPk = entryThingVOList.get(0).getEntrManageNo();
      entryPapersInsert = this.cstbrkrMapper.entryPaperInsert(entryPapersPk);

      /** 통관 물품 리스트 가져와서 한 건 씩 계산 */
      for (EntryThingVO entryThingVO : entryThingVOList) {
         entryThingInsert += this.cstbrkrMapper.insertEntryThings(entryThingVO);
         String entrManageNo = entryThingVO.getEntrManageNo(); // 통관관리번호
         int goodsNo = entryThingVO.getGoodsNo(); // 상품번호
         String cstmrCd = entryThingVO.getCstmrCd(); // 고객코드

         /** 통관 물품 유형에 따라 통관 물품 한 건당 동식물 및 일반 물품 테이블에 insert */
         if (entryThingVO.getThingTy().equals("ETT2")) {
            log.debug("insertEntryThings - GENERAL_THING INSERT");
            GeneralThingVO generalThingVO = new GeneralThingVO();
            generalThingVO.setEntrManageNo(entrManageNo);
            generalThingVO.setGoodsNo(goodsNo);
            generalThingVO.setCstmrCd(cstmrCd);
            generalThingInsert += this.cstbrkrMapper.generalThingInsert(generalThingVO);
         } else {
            log.debug("insertEntryThings - ANIMALS_AND_PLANTS_THING INSERT");
            AnimalAndPlantsThingVO animalAndPlantsThingVO = new AnimalAndPlantsThingVO();
            animalAndPlantsThingVO.setEntrManageNo(entrManageNo);
            animalAndPlantsThingVO.setGoodsNo(goodsNo);
            animalAndPlantsThingVO.setCstmrCd(cstmrCd);
            animalAndPlantsThingInsert += this.cstbrkrMapper.animalAndPlantsThingInsert(animalAndPlantsThingVO);
         }

         /** 통관 물품 HScode 별 세율 불러오기 */
         int goodsTaxrt = this.cstbrkrMapper.searchGoodsTaxrt(goodsNo);

         /** 통관 물품 HScode 별 세율 * 총금액 세금 구하기 */
         long totAmount = entryThingVO.getTotAmount();
         hsCodeAmount += totAmount * goodsTaxrt / 100;

         /** 통관 물품 당 총 금액을 통관 건당 총 금액 합으로 */
         totalTaxAmount += entryThingVO.getTotAmount();
      }

      /** 통관 세액 테이블 insert */
      for (int i = 1; i <= 10; i++) {
         Map<String, Object> entryTaxMap = new HashMap<String, Object>();
         String entryTaxPk = entryThingVOList.get(0).getEntrManageNo();
         entryTaxMap.put("entrManageNo", entryTaxPk);
         entryTaxMap.put("ctTaxIemNo", i);

         if (i == 10) {
            entryTaxMap.put("ctTaxSe", "CTS2");
         } else {
            entryTaxMap.put("ctTaxSe", "CTS1");
         }

         switch (i) {
         case 1:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 1 - 관세");
            // 관세 = 관세과세가격(수량) × 관세율(세액)
            entryTaxMap.put("computAmount", hsCodeAmount);
            calcAmount -= (totalTaxAmount - hsCodeAmount);
            break;
         case 2:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 2 - 개별소비세");
            // 개별소비세 = 개별소비세과세가격(수량) × 개별소비세율(세액)
            double individualConsumptionTax = totalTaxAmount * 0.05;
            entryTaxMap.put("computAmount", individualConsumptionTax);
            calcAmount -= (totalTaxAmount - individualConsumptionTax);
            break;
         case 3:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 3 - 교통에너지환경세");
            // 교통·에너지·환경세 = 수입수량 × 교통·에너지·환경세율 (휘발유 : 529원/ℓ , 경유 : 375원/ℓ)
            // 임의 가정 부산항 -> 부산세관 거리 화물차 기준 계산
            double transportationEnergyEnvironmentTax = (0.5 * 375);
            entryTaxMap.put("computAmount", transportationEnergyEnvironmentTax);
            calcAmount -= (totalTaxAmount - transportationEnergyEnvironmentTax);
            break;
         case 4:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 4 - 주세");
            // 주정 : 주정의 수량(㎘) × (\57,000 + 가산금액) & 탁주, 맥주 : 수량(ℓ) × 세율 & 그 밖의 주류 : 주세의
            // 과세가격(관세의 과세가격 + 관세) × 주세율
            double alcoholTax = 0d;
            entryTaxMap.put("computAmount", alcoholTax);
            calcAmount -= (totalTaxAmount - alcoholTax);
            break;
         case 5:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 5 - 교육세");
            // 개별소비세법의 규정에 의하여 납부하여야 할 개별소비세액 × 30% (등유, 중유 등의 유류 15%)
            // 교통·에너지·환경세법의 규정에 의하여 납부하여야 할 세액 × 15%
            double educationTax = (totalTaxAmount * 0.05) * 0.3;
            entryTaxMap.put("computAmount", educationTax);
            calcAmount -= (totalTaxAmount - educationTax);
            break;
         case 6:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 6 - 농어촌특별세");
            // 관세법 및 조세특례제한법에 의하여 감면을 받는 관세의 감면세액 × 20%
            // 개별소비세법에 의하여 납부하여야 할 개별소비세액 × 10%
            double specialTaxForRuralAreas = (totalTaxAmount * 0.05) * 0.1;
            entryTaxMap.put("computAmount", specialTaxForRuralAreas);
            calcAmount -= (totalTaxAmount - specialTaxForRuralAreas);
            break;
         case 7:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 7 - 부가가치세");
            // 과세가격 = 관세의 과세가격 + 관세 + 개별소비세 + 주세 + 교통세 + 교육세 + 농어촌특별세
            // 부가가치세 = 부가가치세과세가격 × 부가가치세율(10%)
            double vat = (hsCodeAmount + (totalTaxAmount * 0.05) + (0.5 * 375) + (0)
                  + ((totalTaxAmount * 0.05) * 0.3) + ((totalTaxAmount * 0.05) * 0.1)) * 0.1;
            entryTaxMap.put("computAmount", vat);
            calcAmount -= (totalTaxAmount - vat);
            break;
         case 8:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 8 - 신고지연가산세");
            // 물품을 수입 또는 반송하는 자가 관세법 제241조제3항의 규정에 의한 기간 내에 수입 또는 반송의 신고를 하지 아니하는 때에는
            // 신고지연가산세 부과
            // 당해 물품의 과세가격의 20%
            double penaltyTaxForLateReporting = 0d;
            entryTaxMap.put("computAmount", penaltyTaxForLateReporting);
            calcAmount -= (totalTaxAmount - penaltyTaxForLateReporting);
            break;
         case 9:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 9 - 미신고가산세");
            // 무신고 또는 과소신고의 경우 부족세액의 10%(무신고 20%, 부정행위 40%)를 가산세로 부과
            double unreportedPenaltyTax = 0d;
            entryTaxMap.put("computAmount", unreportedPenaltyTax);
            calcAmount -= (totalTaxAmount - unreportedPenaltyTax);
            break;
         case 10:
            log.debug("insertEntryThings - serviceImpl - entryTax insert - 10 - 통관대행료");
            // 평균 통관대행료 통관금액 x 0.008
            double agencyFee = totalTaxAmount * 0.008;
            entryTaxMap.put("computAmount", agencyFee);
            calcAmount -= (totalTaxAmount - agencyFee);
            break;
         }

         entryTaxInsert += this.cstbrkrMapper.entryTaxInsert(entryTaxMap);
      }

      /** 산정 세액 테이블 insert */
      String calculationPk = entryThingVOList.get(0).getEntrManageNo();
      Map<String, Object> calculationMap = new HashMap<String, Object>();
      calculationMap.put("entrManageNo", calculationPk);
      calculationMap.put("calcAmount", calcAmount);
      calculationTaxInsert = this.cstbrkrMapper.calculationTaxInsert(calculationMap);

      log.debug("insertEntryThings - serviceImpl - 통관 물품 테이블 insert 건 수 (통관물품개수) = {}", entryThingInsert);
      log.debug("insertEntryThings - serviceImpl - 일반 물품 테이블 insert 건 수 (통관물품유형에 따라 다름) = {}", generalThingInsert);
      log.debug("insertEntryThings - serviceImpl - 동식물 물품 테이블 insert 건 수 (통관물품유형에 따라 다름) = {}",
            animalAndPlantsThingInsert);
      log.debug("insertEntryThings - serviceImpl - 통관 서류 테이블 insert 건 수 (1나와야정상)= {}", entryPapersInsert);
      log.debug("insertEntryThings - serviceImpl - 통관 세액 테이블 insert 건 수 (10나와야정상) = {}", entryTaxInsert);
      log.debug("insertEntryThings - serviceImpl - 산정 세액 테이블 insert 건 수 (1나와야정상) = {}", calculationTaxInsert);

      return entryThingInsert;
   }

   // 선박일정 불러오는 메소드
   @Override
   public List<ShipDiaryVO> shipDiarySearch() {
      return this.cstbrkrMapper.shipDiarySearch();
   }

   // 통관물품 통관신청시 처리상태 insert
   @Override
   public int entryProcessStatusInsert(EntryProcessStatusVO entryProcessStatusVO) {
      String entrManageNo = entryProcessStatusVO.getEntrManageNo();
      int result = this.cstbrkrMapper.endPresentnPapersVOInsert(entrManageNo);
      result += this.cstbrkrMapper.entryProcessStatusInsert(entryProcessStatusVO);
      return result;
   }

   // 통관 목록 페이지 리스트 불러오는 메서드 Select
   @Override
   public List<EntryProcessListVO> entryProcessList() {
      return this.cstbrkrMapper.entryProcessList();
   }

   // 통관 목록 페이지 검색 조건을 통해 불러오는 메서드 Select
   @Override
   public List<EntryProcessListVO> entryProcessConditionSearchList(Map<String, Object> conditionData) {
      return this.cstbrkrMapper.entryProcessConditionSearchList(conditionData);
   }

   // 통관대행료 계산서 정보 불러오는 메서드 Select
   @Override
   public List<Map<String, Object>> customsClearanceAgencyFeeTaxInvoiceInfo(String entrManageNo) {
      List<Map<String, Object>> response = new ArrayList<Map<String, Object>>();
      Map<String, Object> customerInfo = new HashMap<String, Object>();
      CustomerVO customerVO = this.cstbrkrMapper.searchCustomerInfo(entrManageNo);
      customerInfo.put("entrprsNm", customerVO.getEntrprsNm()); // 기업명
      customerInfo.put("bizrno", customerVO.getBizrno()); // 사업자등록번호
      customerInfo.put("ectmrk", customerVO.getEctmrk()); // 통관고유부호
      customerInfo.put("reprsntAdres", customerVO.getReprsntAdres()); // 대표주소
      customerInfo.put("charger", customerVO.getCharger()); // 담당자

      response.add(customerInfo);

      Map<String, Object> entryTax = new HashMap<String, Object>();
      EntryTaxVO entryTaxVO = this.cstbrkrMapper.searchEntryTaxInfo(entrManageNo);
      entryTax.put("computAmount", entryTaxVO.getComputAmount());

      response.add(entryTax);

      return response;
   }

   /***************************************************************************/

   // 아이디 찾기
   @Override
   public UserVO selectId(String username) {
      return this.cstbrkrMapper.selectId(username);
   }

   // 비빌번호 찾기
   @Override
   public String getPwd(String userId) {
      return this.cstbrkrMapper.getPwd(userId);
   }

   // 비밀번호 검사
   @Override
   public boolean matches(String checkPwd, String pwd) {
      return this.cstbrkrMapper.matches(checkPwd, pwd);
   }

   // 마이페이지 상세
   @Override
   public List<UserVO> userDet(String username) {
      return this.cstbrkrMapper.userDet(username);
   }

   // 비밀번호 제외한 개인정보 업데이트
   @Override
   public int perUpd(UserVO userVo) {
      return this.cstbrkrMapper.perUpd(userVo);
   }

   // 비밀번호 포함한 개인정보 업데이트
   @Override
   public int perUpd2(UserVO userVo) {
      return this.cstbrkrMapper.perUpd2(userVo);
   }

   // 프로필 사진 업데이트
   @Override
   public int profileUpd(CustomsBrokerVO customsBrokerVO) {
      return this.cstbrkrMapper.profileUpd(customsBrokerVO);

   }

   // 수입 신고서
   @Override
   public List<ImportExportCertificateVO> ImportExportCertificate(String entrManageNo) {
      return this.cstbrkrMapper.ImportExportCertificate(entrManageNo);
   }

   // 수입물품 데이터
   @Override
   public List<EntryThingVO> entryThingData(String entrManageNo) {
      return this.cstbrkrMapper.entryThingData(entrManageNo);
   }

   // 수입신고서 세금 데이터
   @Override
   public List<EntryTaxVO> entryTaxData(String entrManageNo) {
      return this.cstbrkrMapper.entryTaxData(entrManageNo);
   }

}