package com.example.demo.controller;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.vo.MemberVo;

import kr.co.youiwe.webservice.BitSms;

@Controller
public class UserController {

	@Autowired
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public void form() {
		System.out.println("join.do 작동함");
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	@ResponseBody
	public String submit(MemberVo m) {
		//ModelAndView mav = new ModelAndView("redirect:/main.do");  //main.do 아직 안만듬
		int re = dao.insert(m);
		String msg = "회원가입에 성공했습니다.";
		if(re != 1) {
			msg = "회원가입에 실패하였습니다.";
		}
		return msg;
	}
	
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public void loginForm() {
		
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	//@ResponseBody
	public ModelAndView loginSubmit(HttpSession session, String member_id, String member_pwd,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String msg = "";
		
		if(dao.isMember(member_id, member_pwd)) {
			MemberVo m = dao.loginMember(member_id);
			session.setAttribute("loginM", m);
			mav.setViewName("redirect:/main.do");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			//out.println("<script>alert('정보를 확인해주세요.'); </script>");
			//out.flush();
			
			mav.setViewName("redirect:/login.do");
			out.println("<script>alert('정보를 확인해주세요.'); </script>");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/login.do");
		session.invalidate();
		return mav;
	}
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("member_id") String member_id) {
		System.out.println("아이디 체크 동작함"+member_id);
		return dao.idchk(member_id);
	
	}
	
	@RequestMapping(value = "/user/nickCheck", method = RequestMethod.GET)
	@ResponseBody
	public int nickCheck(@RequestParam("member_nick") String member_nick) {
		System.out.println("닉네임 체크 동작함"+member_nick);
		return dao.nickchk(member_nick);
	}
	
	/*@RequestMapping(value = "/user/findId", method = RequestMethod.GET)
	@ResponseBody
	public Object findId(@RequestParam("member_name") String member_name,
							@RequestParam("member_phone") String member_phone) {

		return dao.findId(member_name, member_phone);
	
	}*/
	
	@RequestMapping(value = "/user/findId", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findId(@RequestParam("member_name") String member_name,
							@RequestParam("member_phone") String member_phone) {

		return dao.findId(member_name, member_phone);
	
	}
	
	
	/*
	@RequestMapping(value = "/find_id.do", method = RequestMethod.GET)
	public Object findId(@RequestParam("member_name") String member_name,
							@RequestParam("member_phone") String member_phone) {
		System.out.println("find_id.do 작동");

		return "/views/find_id";
	
	}*/
	
	@RequestMapping(value = "/find_id.do", method = RequestMethod.GET)
	public void find_id_form() {
		System.out.println("find_id.do 작동함");
	}
	
	@RequestMapping(value = "/find_pwd.do", method = RequestMethod.GET)
	public void find_pwd_form() {
		System.out.println("find_pwd.do 작동함");
	}

	
	// 비밀번호 수정시 인증코드 발송
		@RequestMapping("/sendCode.do")
		@ResponseBody
		public String sendCode(String to) {
			String code = "";
			String from = "01025598279";
			Random r = new Random();
			int a = r.nextInt(10);
			int b = r.nextInt(10);
			int c = r.nextInt(10);
			int d = r.nextInt(10);
			int e = r.nextInt(10);
			int f = r.nextInt(10);
			code = a+""+b+""+c+""+d+""+e+""+f;
			BitSms sms = new BitSms();
			sms.sendMsg(from, to, code);
			return code;
		}
}
