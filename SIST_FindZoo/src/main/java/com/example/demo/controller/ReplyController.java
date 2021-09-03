package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ReplyDao;
import com.example.demo.vo.ReplyVo;


@Controller
public class ReplyController {
	@Autowired
	private ReplyDao dao;

	public void setDao(ReplyDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/listReply.do")
	public void list(Model model) {
		model.addAttribute("list", dao.findAll());
	}
}