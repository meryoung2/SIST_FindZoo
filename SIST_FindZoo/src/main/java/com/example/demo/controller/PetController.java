package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.dao.PetDao;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.PetVo;

@Controller
public class PetController {
	
	@Autowired
	private MemberDao dao;
	
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private PetDao petDao;

	public void setPetDao(PetDao petDao) {
		this.petDao = petDao;
	}

	// 마이페이지 반려동물 정보 상세 조회 
	@RequestMapping("/member/detailPet.do")
	public void detail(HttpSession session, int pet_num, Model model) {
		int member_num = ((MemberVo)session.getAttribute("loginM")).getMember_num();
		HashMap map = new HashMap();
		map.put("member_num", member_num);
		map.put("pet_num", pet_num);
		model.addAttribute("pet", petDao.detailPet(map));
	}
	
	// 마이페이지 반려동물 추가
	@RequestMapping(value="/member/insertPet.do", method=RequestMethod.GET)
	public void insertPetForm(HttpSession session, Model model) {
		int member_num = ((MemberVo)session.getAttribute("loginM")).getMember_num();
		model.addAttribute("mb", dao.getMember(member_num));
	}
	@RequestMapping(value="/member/insertPet.do", method=RequestMethod.POST)
	public ModelAndView insertPetSubmit(PetVo pet) {
		ModelAndView mav = new ModelAndView("redirect:/member/myInfo.do");
		int re = petDao.insertPet(pet);
		if(re != 1) {
			mav.addObject("msg", "반려동물정보 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	// 마이페이지 반려동물 삭제
	@RequestMapping("/member/deletePet.do")
	public ModelAndView deletePet(HttpSession session, int pet_num) {
		int member_num = ((MemberVo)session.getAttribute("loginM")).getMember_num();
		HashMap map = new HashMap();
		map.put("member_num", member_num);
		map.put("pet_num", pet_num);
		ModelAndView mav = new ModelAndView("redirect:/member/myInfo.do");
		int re = petDao.deletePet(map);
		if(re != 1) {
			mav.addObject("msg", "반려동물정보 삭제에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
}