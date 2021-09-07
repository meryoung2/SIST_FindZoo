package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.FreeDao;
import com.example.demo.vo.FreeVo;

@Controller
public class FreeController {
	
	@Autowired
	private FreeDao dao;

	public void setDao(FreeDao dao) {
		this.dao = dao;
	}
	
	// 자유게시판 목록
	@RequestMapping("/free.do")
	public void list(HttpServletRequest request ,@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		FreeDao.totalRecord = dao.getTotalRecord();
		FreeDao.totalPage = (int)Math.ceil((double)FreeDao.totalRecord/FreeDao.pageSize);
		
		int start = (pageNum - 1) * FreeDao.pageSize + 1;
		int end = start + FreeDao.pageSize - 1;
		
		if(end > FreeDao.totalRecord) {
			end = FreeDao.totalRecord;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("totalPage", FreeDao.totalPage);
	}
	
	// 자유게시판 글 상세내용
	@RequestMapping("/detailFree.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		dao.updateViews(board_num);
		model.addAttribute("f", dao.getFree(board_num));
	}
	
	// 자유게시판 글 작성
	@RequestMapping(value = "/insertFree.do", method = RequestMethod.GET)
	public void insertForm(HttpServletRequest request) {
		
	}
	
	@RequestMapping(value = "/insertFree.do", method = RequestMethod.POST)
	public ModelAndView insertSubmit(HttpServletRequest request, FreeVo f) {
		ModelAndView mav = new ModelAndView("redirect:/free.do");
		String path = request.getRealPath("resources/img");
		
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		String picture_fname = null;
		MultipartFile picture_file = f.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname;
				byte[] data = picture_file.getBytes();
				f.setPicture_fname(picture_fname);
				FileOutputStream fos = new FileOutputStream(path+"/"+picture_fname);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else {
			f.setPicture_fname("");
		}
		
		int re = dao.insert(f);
		if(re != 1) {
			mav.addObject("msg", "Fail!");
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	// 자유게시판 글 수정
	@RequestMapping(value = "/updateFree.do", method = RequestMethod.GET)
	public void form(HttpServletRequest request, Model model, int board_num) {
		model.addAttribute("f", dao.getFree(board_num));
	}
	
	@RequestMapping(value = "/updateFree.do", method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, FreeVo f) {
		ModelAndView mav = new ModelAndView("redirect:/detailFree.do?board_num="+f.getBoard_num());
		String path = request.getRealPath("resources/img");
		String old_picture_fname = f.getPicture_fname();
		
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		String picture_fname = null;
		MultipartFile picture_file = f.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname;
				byte[] data = picture_file.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+picture_fname);
				fos.write(data);
				fos.close();
				f.setPicture_fname(picture_fname);
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		int re = dao.update(f);
		if(re != 1) {
			mav.addObject("msg", "Fail!");
			mav.setViewName("error");
		}else {
			File file = new File(path+"/"+old_picture_fname);
			file.delete();
		}
		return mav;
	}
	
	// 자유게시판 글 삭제
	@RequestMapping("/deleteFree.do")
	@ResponseBody
	public ModelAndView delete(HttpServletRequest request, int board_num) {
		String path = request.getRealPath("resources/img");
		ModelAndView mav = new ModelAndView("redirect:/free.do");
		String old_picture_fname = dao.getFree(board_num).getPicture_fname();
		int re = dao.delete(board_num);
		
		if(re == 1) {
			if(old_picture_fname != null) {
				File file = new File(path+"/"+old_picture_fname);
				file.delete();
			}else {
				
			}
		}
		return mav;
	}
}