package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public void mainFind(HttpServletRequest request, Model model) {
		
		HashMap map = new HashMap();	
		HashMap map_pic = new HashMap();

		model.addAttribute("list", dao.mainFind(map));
		model.addAttribute("p", dao.mainFindPicture(map_pic));
		model.addAttribute("boholist", dao.mainBoho(map));
		model.addAttribute("bohop", dao.mainBohoPicture(map_pic));
	}
	
	
	@RequestMapping(value = "/intro.do", method = RequestMethod.GET)
	public void form() {
		System.out.println("intro.do 작동함");
	}

}
