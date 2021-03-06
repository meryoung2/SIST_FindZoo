package com.example.demo.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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


import com.example.demo.dao.MemberInfoDao;
import com.example.demo.util.Paging;


@Controller
public class MemberInfoController {
	
	@Autowired
	private MemberInfoDao dao;

	public void setDao(MemberInfoDao dao) {
		this.dao = dao;
	}

	@Autowired
	private Paging paging;
	
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	// 회원이 작성한 게시글 목록
	@RequestMapping("/memberInfo.do")
	public void deal(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "member_num", defaultValue = "1") int member_num, Model model) {

		
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
		
		
		model.addAttribute("mb", dao.getMember(member_num));
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("listPet", dao.listPet(member_num));
		model.addAttribute("totalRecord", paging.totalRecord);
		model.addAttribute("totalPage", paging.totalPage);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("member_num", member_num);
		model.addAttribute("listStart", paging.listStart);
		model.addAttribute("listEnd", paging.listEnd);
		
	}
}