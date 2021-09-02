package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.MemberDao;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/MyInfo.do")
	public void detail(int member_num, Model model) {
		model.addAttribute("mb", dao.getMember(member_num));
	}
	
}