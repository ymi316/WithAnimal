package kr.withanimal.board.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.withanimal.board.service.ProtectService;
import kr.withanimal.board.vo.Paging;
import kr.withanimal.board.vo.ProtectVO;

@Controller
public class ProtectController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ProtectController.class);	
	
	@Autowired
	private ProtectService protectService;
	/*
	@RequestMapping(value="/board/protectList")
	public String protectList(Model model, @RequestParam(required=false) Integer p,@RequestParam(required=false) Integer s,@RequestParam(required=false) Integer b) throws MalformedURLException, IOException {
		int currentPage = p==null ? 1 : p;
		int pageSize = s==null ? 10 : s;
		int blockSize = b==null ? 10 : b;
		
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMM");
		SimpleDateFormat format2 = new SimpleDateFormat ("yyyyMMdd");
		String bgnde = format1.format(time)+"01";
		String endde = format2.format(time);		
		List<ProtectVO> list = protectService.readJson(bgnde,endde);
		Paging<ProtectVO> paging = protectService.selectList(list, currentPage, pageSize, blockSize);		
		model.addAttribute(paging);		
		return "redirect:/board/readJSON";	
	}*/
	@RequestMapping(value="/board/protectList")
	public String readJson(Model model, @RequestParam(required=false) Integer p,@RequestParam(required=false) Integer s,@RequestParam(required=false) Integer b
			,@RequestParam(required=false) String bgnde, @RequestParam(required=false) String endde) 
			throws MalformedURLException, IOException{
		int currentPage = p==null ? 1 : p;
		int pageSize = s==null ? 25 : s;
		int blockSize = b==null ? 10 : b;
		System.out.println("ProtectController bgnde:  "+bgnde);
		System.out.println("ProtectController endde:  "+endde);
		System.out.println("----------------------------------------------------------------------------");
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMM");
		SimpleDateFormat format2 = new SimpleDateFormat ("yyyyMMdd");
		
		//if(bgnde==null||bgnde.trim().equals("")) bgnde =format1.format(time)+"01";
		//if(endde==null||endde.trim().equals("")) endde =format2.format(time);
		if(bgnde==null||bgnde.trim().equals("")) bgnde ="20191201";
		if(endde==null||endde.trim().equals("")) endde ="20191231";
				
		Paging<ProtectVO> paging = protectService.selectList(bgnde, endde, currentPage, pageSize, blockSize);
		model.addAttribute("paging",paging);		
		model.addAttribute("bgnde",bgnde);		
		model.addAttribute("endde",endde);		
		
		//System.out.println("ProtectController readJson paging"+paging);
		//System.out.println("ProtectController readJson list"+list);
		return "protectList";
	}
	

	@RequestMapping(value="/board/protectResult" ) 
	public String protectResultPost(HttpServletRequest request, Model model, @ModelAttribute ProtectVO vo
			,@RequestParam(required=false) String bgnde, @RequestParam(required=false) String endde) throws MalformedURLException, IOException {
		if(vo==null) return "protectList";
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("p"));
		}catch (Exception e) {
			;
		}
		int pageSize = 25;
		try {
			pageSize = Integer.parseInt(request.getParameter("s"));
		}catch (Exception e) {
			;
		}
		int blockSize = 10;
		try {
			blockSize = Integer.parseInt(request.getParameter("b"));
		}catch (Exception e) {
			;
		}
		int idx = -1;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
		}catch (Exception e) {
			;
		}
	
		bgnde = request.getParameter(bgnde);
		endde =request.getParameter(endde);
		
		System.out.println("protectResultPost bgnde:  "+bgnde);
		System.out.println("protectResultPost endde:  "+endde);

	    /*ProtectVO vo = protectService.selectByIdx(bgnde, endde, idx);
	    System.out.println("protectResultPost vo:  "+vo);
		if(vo==null) {
			return "redirect:/board/protectList";
		}*/
		model.addAttribute("vo",vo); 
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("blockSize",blockSize);
		return "protectResult";
	}

}
