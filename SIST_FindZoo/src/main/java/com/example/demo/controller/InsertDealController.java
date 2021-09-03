package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DealDao;
import com.example.demo.vo.DealVo;

@Controller
@RequestMapping("/insertDeal.do")
public class InsertDealController {
	
	@Autowired
	private DealDao dao;
	public void setDao(DealDao dao) {
		this.dao = dao;
	}
	
	
	// 거래게시판 글쓰기 컨트롤러
	@RequestMapping(method = RequestMethod.GET)
	public void form(HttpServletRequest request ,Model model, 
			@RequestParam(value = "board_num", defaultValue = "0") int board_num, 
			@RequestParam(value = "deal_num", defaultValue = "0") int deal_num) {
		System.out.println(board_num);
		System.out.println(deal_num);
		model.addAttribute("board_num", board_num);
		model.addAttribute("deal_num", deal_num);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(DealVo d) {
		ModelAndView mav = new ModelAndView("redirect:/listDeal.do");
		int re = dao.insertDeal(d);
		if(re != 1) {
			mav.addObject("msg","글쓰기에 실패하였습니다.");
			mav.setViewName("redirect:/listDeal.do");
		}
		return mav;
	}
}
