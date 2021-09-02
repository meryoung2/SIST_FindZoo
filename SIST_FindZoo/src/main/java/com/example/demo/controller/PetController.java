package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.PetDao;

@Controller
public class PetController {
	
	@Autowired
	private PetDao dao;

	public void setDao(PetDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/MyInfo.do")
	public void detail(int member_num, Model model) {
		model.addAttribute("pet", dao.getPet(member_num));
	}
	
}