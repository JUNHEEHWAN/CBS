package com.team4.cbs.exam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cbs/exam")
public class ExamController {
	
	@GetMapping("/form")
	public String formExam() {
		return "exam/formExam";
	}
	
	@GetMapping("/table")
	public String tableExam() {
		return "exam/tableExam";
	}
	
	@GetMapping("/table2")
	public String tableExam2() {
		return "exam/tableExam2";
	}
}
