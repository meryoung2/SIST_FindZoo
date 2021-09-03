package com.example.demo.controller;


import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DealDao;
import com.example.demo.vo.DealVo;

@Controller
public class DealController {
	@Autowired
	private DealDao dao;
	public void setDao(DealDao dao) {
		this.dao = dao;
	}
	
	// 거래게시판 목록 컨트롤러
	@RequestMapping("/listDeal.do")
	public void list(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		DealDao.totalRecord = dao.getTotalRecordDeal();
		DealDao.totalPage = (int)Math.ceil((double)DealDao.totalRecord/DealDao.pageSize);
		
		int start = (pageNum - 1) * DealDao.pageSize + 1;
		int end = start + DealDao.pageSize - 1;
		
		if(end > DealDao.totalRecord) {
			end = DealDao.totalRecord;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("list",dao.findAll(map));
		model.addAttribute("totalPage", DealDao.totalPage);
		
	}
	
	// 거래게시판 상세보기 컨트롤러
	@RequestMapping("/detailDeal.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		dao.updateHit(board_num);
		model.addAttribute("d", dao.getDeal(board_num));
	}
	
	// 거래게시판 글작성 컨트롤러
	@RequestMapping(value = "/insertDeal.do", method = RequestMethod.GET)
	public void form(HttpServletRequest request) {}
		
	@RequestMapping(value = "/insertDeal.do" , method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, DealVo d) {
		ModelAndView mav = new ModelAndView("redirect:/listDeal.do");
		String path = request.getRealPath("resources/img");
		System.out.println(path);
		
		String picture_fname = null;
		int fsize = 0;
		MultipartFile picture_file = d.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				byte[] data = picture_file.getBytes();
				fsize = data.length;
				d.setPicture_fname(picture_fname);
				FileOutputStream fos = new FileOutputStream(path+"/"+picture_fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("파일업로드중 오류발생 : " + e.getMessage());
			}
		}else {
			d.setPicture_fname("");
		}
		
		int re = dao.insertDeal(d);
		if(re != 1) {
			mav.addObject("msg","글쓰기에 실패하였습니다.");
			mav.setViewName("redirect:/listDeal.do");
		}
		return mav;
	}
}
