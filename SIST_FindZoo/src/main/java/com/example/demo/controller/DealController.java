package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
}
