package com.example.demo.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.dao.PetDao;
import com.example.demo.vo.MemberVo;

import kr.co.youiwe.webservice.BitSms;

@Controller
public class MyInfoController {
	
	@Autowired
	private MemberDao dao;
	
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@Autowired
	private PetDao petDao;

	public void setDao(PetDao petDao) {
		this.petDao = petDao;
	} 
	
	// 마이페이지 내 정보 조회
	@RequestMapping("/myInfo.do")
	public ModelAndView getMemberPet(int member_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mb", dao.getMember(member_num));
		mav.addObject("listPet", petDao.listPet(member_num));
		return mav;
	}
	
	// 마이페이지 내 정보 수정
	@RequestMapping(value="/updateInfo.do", method=RequestMethod.GET)
	public void updateInfoForm(int member_num, Model model) {
		model.addAttribute("mb", dao.getMember(member_num));		
	}
	@RequestMapping(value="/updateInfo.do", method=RequestMethod.POST)
	public ModelAndView updateInfoSubmit(MemberVo mb) {
		int member_num = mb.getMember_num();
		ModelAndView mav = new ModelAndView("redirect:/myInfo.do?member_num="+member_num);
		int re = dao.updateInfo(mb);
		if(re != 1) {
			mav.addObject("msg", "내 정보 수정에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	// 마이페이지 비밀번호 변경
	@RequestMapping(value="/updatePwd.do", method=RequestMethod.GET)
	public void updatePwdForm(int member_num, Model model) {
		model.addAttribute("mb", dao.getMember(member_num));		
	}
	@RequestMapping(value="/updatePwd.do", method=RequestMethod.POST)
	public ModelAndView updatePwdSubmit(MemberVo mb) {
		int member_num = mb.getMember_num();
		ModelAndView mav = new ModelAndView("redirect:/myInfo.do?member_num="+member_num);
		int re = dao.updatePwd(mb);
		if(re != 1) {
			mav.addObject("msg", "비밀번호 변경에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	// 닉네임 중복 확인
	@RequestMapping("/checkNick.do")
	public ModelAndView checkNick() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	@RequestMapping("/checkNickProcess.do")
	public ModelAndView checkNickProcess() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	// 연락처 수정시 인증코드 발송
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
	
	// 회원 탈퇴(해당 회원의 정보나 게시물을 실제로 삭제하지 않고 일부 정보만 수정하여 접근을 제한)
	@RequestMapping(value="/deleteChangeInfo.do", method=RequestMethod.GET)
	public void deleteChangeInfoForm(int member_num, Model model) {
		model.addAttribute("mb", dao.getMember(member_num));		
	}
	@RequestMapping(value="/deleteChangeInfo.do", method=RequestMethod.POST)
	public ModelAndView deleteChangeInfoSubmit(MemberVo mb) {
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		int re = dao.deleteChangeInfo(mb);
		if(re != 1) {
			mav.addObject("msg", "회원 탈퇴에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
}