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
public class DealController {
	@Autowired
	private DealDao dao;
	public void setDao(DealDao dao) {
		this.dao = dao;
	}
	
	// 거래게시판 목록 컨트롤러
	@RequestMapping("/listDeal.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.findAll());
		return mav;
	}
	
	// 거래게시판 상세보기 컨트롤러
	@RequestMapping("/detailDeal.do")
	public void detail(HttpServletRequest request, Model model,int board_num) {
		dao.updateHit(board_num);
		model.addAttribute("d", dao.getDeal(board_num));
	}
	
	// 거래게시판 글쓰기 컨트롤러
	@RequestMapping(value = "insertDeal.do", method = RequestMethod.GET)
	public void form(HttpServletRequest request ,Model model, 
			@RequestParam(value = "board_type_num", defaultValue = "33") int board_type_num) {
		System.out.println(board_type_num);
		model.addAttribute("board_type_num", board_type_num);
		}
		
	@RequestMapping(value = "insertDeal.do" , method = RequestMethod.POST)
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
