package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.MyPostDao;
import com.example.demo.util.Paging;
import com.example.demo.vo.MemberVo;


@Controller
public class MyPostController {
	
	@Autowired
	private MyPostDao dao;

	public void setDao(MyPostDao dao) {
		this.dao = dao;
	}

	@Autowired
	private Paging paging;
	
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	// 회원이 작성한 게시글 목록
	@RequestMapping("/member/myPost.do")
	public void deal(HttpSession session, HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		
		int member_num = ((MemberVo)session.getAttribute("loginM")).getMember_num();
		String member_nick = ((MemberVo)session.getAttribute("loginM")).getMember_nick();
		
		paging.totalRecord = dao.getTotalRecordMyPost(member_num);
		paging.totalPage = paging.getTotalPage();
		paging.start = paging.getStart(pageNum);
		paging.end = paging.getEnd(paging.start, pageNum);
		paging.pageNum = pageNum;
		paging.listStart = paging.getListStart(pageNum);
		paging.listEnd = paging.getListEnd();
		
		if(paging.end > paging.totalRecord) {
			paging.end = paging.totalRecord;
		}
		
		HashMap map = new HashMap();
		map.put("start", paging.start);
		map.put("end", paging.end);
		map.put("member_num", member_num);

		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("totalRecord", paging.totalRecord);
		model.addAttribute("totalPage", paging.totalPage);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("member_num", member_num);
		model.addAttribute("member_nick", member_nick);
		model.addAttribute("listStart", paging.listStart);
		model.addAttribute("listEnd", paging.listEnd);
		
	}
	
}