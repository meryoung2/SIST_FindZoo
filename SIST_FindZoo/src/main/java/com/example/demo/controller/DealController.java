package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DealDao;

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
	
}
