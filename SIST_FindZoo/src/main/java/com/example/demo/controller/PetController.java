package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.dao.PetDao;
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
	@RequestMapping("/detailPet.do")
	public void detail(int pet_num, Model model) {
		model.addAttribute("pet", petDao.detailPet(pet_num));
	}
	
	// 마이페이지 반려동물 추가
	@RequestMapping(value="/insertPet.do", method=RequestMethod.GET)
	public void insertPetForm(int member_num, Model model) {
		model.addAttribute("mb", dao.getMember(member_num));
	}
	@RequestMapping(value="/insertPet.do", method=RequestMethod.POST)
	public ModelAndView insertPetSubmit(PetVo pet) {
		int member_num = pet.getMember_num();
		ModelAndView mav = new ModelAndView("redirect:/myInfo.do?member_num="+member_num);
		int re = petDao.insertPet(pet);
		if(re != 1) {
			mav.addObject("msg", "반려동물정보 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	// 마이페이지 반려동물 삭제
	@RequestMapping("/deletePet.do")
	public ModelAndView deletePetSubmit(int pet_num) {
		// 세션 적용이 안 되어있어서 일단 삭제하면 1번 회원 마이페이지로 이동(레코드 삭제는 됨)
		ModelAndView mav = new ModelAndView("redirect:/myInfo.do?member_num=1");
		int re = petDao.deletePet(pet_num);
		if(re != 1) {
			mav.addObject("msg", "반려동물정보 삭제에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
}