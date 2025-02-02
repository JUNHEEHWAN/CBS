package com.team4.cbs.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.cbs.admin.service.NoticeService;
import com.team4.cbs.common.vo.NoticeVO;
import com.team4.cbs.util.ArticlePage;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value={ "cbs/cstbrkr", "/cbs/pbsvnt", "/cbs/trnsprt"})
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	//공지사항 화면 
		@GetMapping("/notice")
		public String notice(HttpServletRequest request) {
			
			String url = request.getServletPath();
			log.debug("url 확인 =>" + url );
			
			if(request.getServletPath().equals("/cbs/cstbrkr/notice")) {
				return "cstbrkr/notice";
			}else if(request.getServletPath().equals("/cbs/pbsvnt/notice")) {
				return "pbsvnt/notice";
			}else if(request.getServletPath().equals("/cbs/trnsprt/notice")) {
			
				return "trnsprt/notice";
			}
			return null;
			
		}
		
		
		
		
		//공지사항 전체 리스트
			@ResponseBody
			@PostMapping("/noticeList")
			public ArticlePage<NoticeVO> noticeList(@RequestBody(required=false) Map<String,Object> map){
				log.debug("map 체크 : " + map);
				
				List<NoticeVO> noticeList = this.noticeService.noticeList(map);
				
				log.debug("noticeList 체크 : " + noticeList );
				
				//페이징처리 시작///////////////////
				//전체 갯수 확인
				int total = this.noticeService.noticeGetTotal(map);
				log.debug("체크 Total : " + total);
				
				//select 5개의 행
				int size = 10;
				
				//jsp에서 넘겨준 현재 페이지수(currentPage)
				String currentPage = map.get("currentPage").toString();
				log.debug("체크 currentPage : " + currentPage);
				
				//jsp 넘겨준 keyword(검색조건)
				String keyword = map.get("keyword").toString();
				log.debug("keyword : " + keyword );
				
				//ArticlePage객체 생성 -> ArticlePage(사용해야할 VO>
				ArticlePage<NoticeVO> data = new ArticlePage<NoticeVO>(total, Integer.parseInt(currentPage), size, noticeList, keyword);
				//AriticlePage안의 url 속에 값넣기
				String url = "/cbs/admin";
				data.setUrl(url);
				
				log.debug("체크 data : " + data.toString());
				
				return data;
				
			}
			
			//공지사항 상세화면 
			@GetMapping("/noticeDetail")
			public String noticeDetail(String noticeNo, Model model, HttpServletRequest request) {
				log.debug("제목 클릭 상세 titl-> : " + noticeNo);
				
				List<NoticeVO> noticeList = this.noticeService.noticeDetail(noticeNo);
				log.debug("noticeList -> " + noticeList);
				model.addAttribute("noticeList", noticeList);
				
				if(request.getServletPath().equals("/cbs/cstbrkr/noticeDetail")) {
					return "cstbrkr/noticeDetail";
				}else if(request.getServletPath().equals("/cbs/pbsvnt/noticeDetail")) {
					return "pbsvnt/noticeDetail";
				}else if(request.getServletPath().equals("/cbs/trnsprt/noticeDetail")) {
				
					return "trnsprt/noticeDetail";
				}
				return null;
				
				
			}
	
}
