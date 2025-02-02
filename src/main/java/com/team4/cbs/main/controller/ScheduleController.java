package com.team4.cbs.main.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team4.cbs.main.service.ScheduleService;
import com.team4.cbs.main.vo.ScheduleVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cbs")
public class ScheduleController {

	
	@Inject
	ScheduleService scheduleserive;
	
	// 이벤트 조회
	@ResponseBody
	@GetMapping("/calendarUpdate")
	public List<Map<String, Object>> showAllEventInUpdate(Principal principal) throws Exception{
		String id = principal.getName(); // 전역 변수로 설정된 사용자 이름 사용
		
		log.debug("id : {}",id);
	    List<Map<String, Object>> jsonArr = new ArrayList<>();

	    for(ScheduleVO schedule : scheduleserive.findAll(id)) {
	        Map<String, Object> eventMap = new HashMap<>();
	        eventMap.put("title", schedule.getCaleCn());
	        eventMap.put("start", schedule.getCaleDateTimeStart());
	        eventMap.put("end", schedule.getCaleDateTimeEnd());
	        jsonArr.add(eventMap);
	    }
	    
	    log.info("jsonArrCheck:{}",jsonArr);
	    return jsonArr;
	}

	
	// 이벤트 등록
	@ResponseBody
	@PostMapping("/addevent")
	public String addEvent(@RequestBody List<Map<String, Object>> param, Principal principal) {
	    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		 String id = principal.getName(); // 전역 변수로 설정된 사용자 이름 사용

	    for (Map<String, Object> event : param) {
	    	String userName = (String) id;
	        String eventName = (String) event.get("title");
	        String startDateString = (String) event.get("start");
	        String endDateString = (String) event.get("end");
	        
	        LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
	        LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
	        
	        LocalDateTime startDate = startDateUTC.plusHours(9);
	        LocalDateTime endDate = endDateUTC.plusHours(9);
	        
	        ScheduleVO scheduleVO = new ScheduleVO();
	        
	        scheduleVO.setUserCd(userName);
	        scheduleVO.setCaleCn(eventName);
	        scheduleVO.setCaleDateTimeStart(String.valueOf(startDate));
	        scheduleVO.setCaleDateTimeEnd(String.valueOf(endDate));
	        
	        this.scheduleserive.insert(scheduleVO);
	    }
	    
	    return "/cbs/calendarUpdate";
	}

	
	// 이벤트 삭제
	@ResponseBody
	@PostMapping("/delete")
	public String deleteEvent(@RequestBody List<Map<String, Object>> param) {
	    
	    int result = 0;
	    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
	    
	    for(Map<String, Object> event : param) {
	        String startDateString = (String) event.get("start");
	        LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
	        
	        log.info("startDate : " + startDate);
	        
	        result += this.scheduleserive.delete(String.valueOf(startDate));
	    }
	    
	    if(result > 0) {
	        return "/cbs/main"; // 삭제가 성공한 경우 메인 페이지로 리다이렉트
	    } else {
	        return "/cbs/calendarUpdate"; // 삭제가 실패한 경우 이벤트 조회 페이지로 리다이렉트
	    }
	}

	
	// 이벤트 수정
	@ResponseBody
	@PostMapping("/modify")
	public String modifyEvent(@RequestBody List<Map<String, Object>> param) {
	    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
	    
	    for(Map<String, Object> event : param) {
	        String eventName = (String) event.get("title");
	        String startDateString = (String) event.get("start");
	        String endDateString = (String) event.get("end");
	        String oldStartString = (String) event.get("oldStart");
	        String oldEndString = (String) event.get("oldEnd");
	        
	        LocalDateTime modifiedStartDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
	        LocalDateTime modifiedEndDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
	        LocalDateTime oldStart = LocalDateTime.parse(oldStartString, dateTimeFormatter);
	        LocalDateTime oldEnd = LocalDateTime.parse(oldEndString, dateTimeFormatter);
	        
	        ScheduleVO scheduleVO = new ScheduleVO();
	        scheduleVO.setUserCd(eventName);
	        scheduleVO.setCaleDateTimeStart(String.valueOf(modifiedStartDate));
	        scheduleVO.setCaleDateTimeEnd(String.valueOf(modifiedEndDate));
	        scheduleVO.setCaleDateOldTimeStart(String.valueOf(oldStart));
	        scheduleVO.setCaleDateOldTimeEnd(String.valueOf(oldEnd));
	        
	        log.info("update : " + scheduleVO.toString());
	        
	        int result = this.scheduleserive.update(scheduleVO);
	        if(result <= 0) {
	            return "/cbs/calendarUpdate"; // 업데이트 실패 시 페이지 유지
	        }
	    }
	    
	    return "/cbs/calendarUpdate"; // 모든 업데이트가 성공한 경우 메인 페이지로 리다이렉트
	}

}
