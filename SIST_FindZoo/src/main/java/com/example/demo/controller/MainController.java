package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MainDao;

@Controller
public class MainController {

	@Autowired
	private MainDao dao;

	public void setDao(MainDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/main.do")
	public ModelAndView mainFind(HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mainFind", dao.mainFind());
		HashMap map = new HashMap();	
		HashMap map_pic = new HashMap();

		model.addAttribute("list", dao.mainFind());
		model.addAttribute("p", dao.mainFindPicture());
		
		return mav;
	}

}
