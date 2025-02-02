package com.team4.cbs.admin.service;

import java.util.List;
import java.util.Map;

import com.team4.cbs.common.vo.NoticeVO;

public interface NoticeService {

	// 전체리스트 
	public List<NoticeVO> noticeList(Map<String, Object> map);
	
	
	//공지사항 상세 페이지
	public List<NoticeVO> noticeDetail(String noticeNo);


	// 공지사항 수정
	public int update(NoticeVO noticeVO);

	// 공지사항 삭제
	public int delete(String noticeNo);

	// 페이징 처리를 위해 전체 행갯수 가져오기 (공지사항)
	public int noticeGetTotal(Map<String, Object> map);

	
	//공지사항 등록
	public int noticeCreate(NoticeVO noticeVO);

	


}
