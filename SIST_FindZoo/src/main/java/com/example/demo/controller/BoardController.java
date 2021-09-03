package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
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

import com.example.demo.dao.BoardDao;
import com.example.demo.vo.BoardVo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;

	public void setDao(BoardDao dao) {
		this.dao = dao;
	}
	
	// 자유게시판 목록
	@RequestMapping("/listBoard.do")
	public void list(HttpServletRequest request ,@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		BoardDao.totalRecord = dao.getTotalRecord();
		BoardDao.totalPage = (int)Math.ceil((double)BoardDao.totalRecord/BoardDao.pageSize);
		
		int start = (pageNum - 1) * BoardDao.pageSize + 1;
		int end = start + BoardDao.pageSize - 1;
		
		if(end > BoardDao.totalRecord) {
			end = BoardDao.totalRecord;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("totalPage", BoardDao.totalPage);
	}
	
	// 자유게시판 글 상세내용
	@RequestMapping("/detailBoard.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		dao.updateViews(board_num);
		model.addAttribute("b", dao.getBoard(board_num));
	}
	
	// 자유게시판 글 작성
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public void insertForm(HttpServletRequest request) {
		
	}
	
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public ModelAndView insertSubmit(HttpServletRequest request, BoardVo b) {
		ModelAndView mav = new ModelAndView("redirect:/listBoard.do");
		String path = request.getRealPath("resources/img");
		System.out.println(path);
		
		String picture_fname = null;
		int fsize = 0;
		MultipartFile picture_file = b.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				byte[] data = picture_file.getBytes();
				fsize = data.length;
				b.setPicture_fname(picture_fname);
				FileOutputStream fos = new FileOutputStream(path+"/"+picture_fname);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}else {
			b.setPicture_fname("");
		}
		
		int re = dao.insert(b);
		if(re != 1) {
			mav.addObject("msg", "Fail!");
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	// 자유게시판 글 삭제
	@RequestMapping("/deleteBoard.do")
	@ResponseBody
	public ModelAndView delete(HttpServletRequest request, int board_num) {
		String path = request.getRealPath("resources/img");
		ModelAndView mav = new ModelAndView("redirect:/listBoard.do");
		String oldFname = dao.getBoard(board_num).getPicture_fname();
		int re = dao.delete(board_num);
		
		if(re == 1) {
			if(!oldFname.isEmpty()) {
				File file = new File(path+"/"+oldFname);
				file.delete();
			}else {
				mav.addObject("msg", "Fail!");
				mav.setViewName("error");
			}
		}
		return mav;
	}
}