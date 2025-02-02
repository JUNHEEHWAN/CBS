package com.team4.cbs.pbsvnt.quar.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.pbsvnt.quar.vo.QuarantineItemVO;
import com.team4.cbs.pbsvnt.quar.vo.QuarantineRequestVO;

public interface QuarService {

	List<QuarantineRequestVO> list(Map<String,Object> map);

	QuarantineRequestVO getReady(QuarantineRequestVO quarantineRequestVO);

	//int qGetInsert(QuarantineItemVO quarantineItemVO);

	int quarInsert(QuarantineItemVO item);

	int getQuarUpdate(QuarantineItemVO quarantineItemVO);

	List<QuarantineItemVO> detailList(QuarantineItemVO quarantineItemVO);

	List<QuarantineItemVO> quarModifyList(QuarantineItemVO quarantineItemVO);

	int quarDelete(QuarantineItemVO quarantineItemVO);

	int getTotal3(Map<String, Object> map);
	
	int getTotal2(Map<String, Object> map);

	List<QuarantineRequestVO> startList(Map<String,Object> map);

	int assignUpdate(QuarantineRequestVO request);

	int entAssignUpdate(QuarantineRequestVO request);

	int quarStuUpdate(QuarantineItemVO quarantineItemVO);

	List<QuarantineRequestVO> getChitPaper(QuarantineRequestVO quarantineRequestVO);

	List<QuarantineRequestVO> paperList(Map<String, Object> map);

	int getTotal4(Map<String, Object> map);

	List<QuarantineItemVO> getQuarPaper(QuarantineItemVO quarantineItemVO);

	List<QuarantineItemVO> getQuarName(QuarantineItemVO quarantineItemVO);


	//QuarantineItemVO qGetInsert(QuarantineItemVO quarantineItemVO);

	//QuarReadyVO getReady(int goodsNo);




}
