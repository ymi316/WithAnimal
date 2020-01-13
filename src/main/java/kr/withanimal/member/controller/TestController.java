package kr.withanimal.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.withanimal.member.service.TestService;
import kr.withanimal.member.vo.TestVO;

@Controller
public class TestController {
	@Autowired
	private TestService testService;
	
	@RequestMapping(value="/testVO")
	@ResponseBody
	public TestVO testObject() {
		return new TestVO(1, "한사람", 22);
	}
	
	@RequestMapping(value="/testTest",produces="text/plan;charset=utf-8")
	@ResponseBody
	public String testTest(){
		return "한글 qwert `12345!@#$%";
	}
	
	@RequestMapping(value="/testDB")
	public String testDB(Model model){
		model.addAttribute("today",testService.today());
		model.addAttribute("mul",testService.mul(11, 22));
		model.addAttribute("sum",testService.sum(11, 22, 33));
		return "testDB";
	}
}
