package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	@RequestMapping("/login.do")
	public void login() {
		
	}
	
	@RequestMapping("/loginOK.do")
	public ModelAndView loginOK(HttpSession session) {
		System.out.println("로그인 성공!");
		ModelAndView mav = new ModelAndView("redirect:/hello.do");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		 String id = ((User)authentication.getPrincipal()).getUsername();
		
		 session.setAttribute("member", dao.getMember(id));
		return mav;
	}
	
	@RequestMapping(value="/join.do",method = RequestMethod.GET)
	public void joinForm() {
		
	}
	
	@RequestMapping(value="/join.do",method = RequestMethod.POST)
	@ResponseBody
	public String joinSubmit(MemberVo m) {
		m.setMember_pwd(passwordEncoder.encode(m.getMember_pwd()));
		System.out.println(m.getMember_num());
		System.out.println(m.getMember_id());
		System.out.println(m.getMember_pwd());
		System.out.println(m.getMember_nick());
		System.out.println(m.getMember_sms());
		//int re = dao.insert(m);
		return "OK";
	}
}