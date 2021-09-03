package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.BoardDao;

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
		System.out.println(pageNum);
		BoardDao.totalRecord = dao.getTotalRecord();
		BoardDao.totalPage = (int)Math.ceil((double)BoardDao.totalRecord/BoardDao.pageSize);
		
		int start = (pageNum - 1) * BoardDao.pageSize + 1;
		int end = start + BoardDao.pageSize - 1;
		
		if(end > BoardDao.totalRecord) {
			end = BoardDao.totalRecord;
		}
		
		System.out.println(start);
		System.out.println(end);
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("totalPage", BoardDao.totalPage);
	}
	
	// 자유게시판 글 상세내용
	@RequestMapping("/detailBoard.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		model.addAttribute("b", dao.getBoard(board_num));
	}
}