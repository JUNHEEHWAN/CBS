
package com.team4.cbs.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team4.cbs.admin.mapper.NoticeMapper;
import com.team4.cbs.admin.service.NoticeService;
import com.team4.cbs.common.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;

	// 전체리스트 조회
	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		return noticeMapper.noticeList(map);
	}
	

	// 상세페이지
	@Override
	public List<NoticeVO> noticeDetail(String noticeNo) {
		return this.noticeMapper.noticeDetail(noticeNo);
	}
	

	// 공지사항 등록

	@Override
	public int noticeCreate(NoticeVO noticeVO) {
		return this.noticeMapper.noticeCreate(noticeVO);
	}

	// 공지사항 수정
	@Override
	public int update(NoticeVO noticeVO) {
		return this.noticeMapper.update(noticeVO);
	}

	// 공지사항 삭제
	@Override
	public int delete(String noticeNo) {
		return this.noticeMapper.delete(noticeNo);
	}

	// 페이징 처리를 위해 전체 행갯수 가져오기 (공지사항)
	@Override
	public int noticeGetTotal(Map<String, Object> map) {
		return noticeMapper.noticeGetTotal(map);
	}




}

