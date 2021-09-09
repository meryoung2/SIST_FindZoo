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

import com.example.demo.dao.DealDao;
import com.example.demo.dao.FindDao;
import com.example.demo.util.Paging;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.FindVo;

import ch.qos.logback.core.util.FileSize;


@Controller
public class FindController {
	
	@Autowired
	private FindDao dao;
	public void setDao(FindDao dao) {
		this.dao = dao;
	}

	@Autowired
	private Paging paging;
	
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	// 찾아요게시판, 댓글 목록 컨트롤러
	@RequestMapping("/find.do")
	public void find(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {

		paging.totalRecord = dao.getTotalRecordFind();
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
		
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("totalRecord", paging.totalRecord);
		model.addAttribute("totalPage", paging.totalPage);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("listStart", paging.listStart);
		model.addAttribute("listEnd", paging.listEnd);
		
		
		/*
		System.out.println("pageNum:" + pageNum);
		DealDao.totalRecord = dao.getTotalRecordDeal();
		DealDao.totalPage = (int)Math.ceil((double)DealDao.totalRecord/DealDao.pageSize);
		
		int start = (pageNum - 1)*DealDao.pageSize + 1;
		int end = start + DealDao.pageSize - 1;
		
		if(end > DealDao.totalRecord) {
			end = DealDao.totalRecord;
		}
		System.out.println("start" + start);
		System.out.println("end" + end);
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		model.addAttribute("list",dao.findAll(map));
		model.addAttribute("totalPage", DealDao.totalPage);
		*/
	}
	
	// 찾아요게시판 검색 후 목록 컨트롤러
	// 찾아요게시판 검색에 필요한 셀렉트에서 작성자를 기본값으로 하는 search_option과 
	// 사용자가 입력할 검색어를 받는(기본값이 공란이라 ""임) keyword를 매개변수로 전달받은 후
	// hash메소드를 통해 map이라는 변수에 담고 model객체를 통해 searchFind메소드를 호출한다.
	@RequestMapping("/searchFind.do")
	public void searchFind(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			@RequestParam(defaultValue = "member_nick") String search_option, 
			@RequestParam(defaultValue = "") String keyword) {
		paging.totalRecord = dao.getTotalRecordFind();
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
		map.put("keyword", keyword);
		map.put("search_option", search_option);
		
		model.addAttribute("list",dao.searchFind(map));
		model.addAttribute("totalPage", paging.totalPage);
		model.addAttribute("totalRecord", paging.totalRecord);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("listStart", paging.listStart);
		model.addAttribute("listEnd", paging.listEnd);
	}
	
	
	// 찾아요게시판 상세보기 컨트롤러
	@RequestMapping("/detailFind.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		dao.updateViewsFind(board_num);
		model.addAttribute("f", dao.getFind(board_num));
		model.addAttribute("list", dao.findAll(board_num));
	}
	
	
	// 찾아요게시판 글작성 컨트롤러
	@RequestMapping(value = "/insertFind.do", method = RequestMethod.GET)
	public void form(HttpServletRequest request) {}
	
	@RequestMapping(value = "/insertFind.do" , method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, FindVo f) {
		ModelAndView mav = new ModelAndView("redirect:/find.do");
		String path = request.getRealPath("resources/img");
		System.out.println(path);
		
		String picture_fname = null;
		int fsize = 0;
		
		MultipartFile picture_file = f.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname;
				byte[] data = picture_file.getBytes();
				fsize = data.length;
				f.setPicture_fname(picture_fname);
				FileOutputStream fos = new FileOutputStream(path+"/"+picture_fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("파일업로드중 오류발생 : " + e.getMessage());
			}
		}else {
			f.setPicture_fname("null");
		}
		
		int re = dao.insertFind(f);
		if(re != 1) {
			mav.addObject("msg","게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	// 찾아요게시판 수정 컨트롤러
	@RequestMapping(value = "/updateFind.do", method = RequestMethod.GET)
	public void findUpdateForm(HttpServletRequest request, Model model, int board_num) {
		model.addAttribute("f", dao.getFind(board_num));
	}
	
	@RequestMapping(value = "/updateFind.do", method = RequestMethod.POST)
	public ModelAndView findUpdateSubmit(HttpServletRequest request, FindVo f) {
		ModelAndView mav = new ModelAndView("redirect:/detailFind.do?board_num="+f.getBoard_num());
		String path = request.getRealPath("/resources/img");
		String oldFname = f.getPicture_fname();
		
		String picture_fname = null;
		int fsize = 0;
		
		MultipartFile picture_file = f.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date)) + "_" + picture_fname;
				byte []data = picture_file.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + picture_fname);
				fos.write(data);
				fsize = data.length;
				fos.close();
				f.setPicture_fname(picture_fname);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("예외발생:"+ e.getMessage());
			}
		}
		
		int re = dao.updateFind(f);
		if(re != 1) {
			mav.addObject("msg", "게시물 수정에 실패하였습니다.");
			mav.setViewName("/find.do");
		}else {
			if(fsize != 0)	{
			File file = new File(path + "/" + oldFname);
				file.delete();
			}
		}
		return mav;
	}
	
	/*
	
	@RequestMapping(value = "/deleteDeal.do", method = RequestMethod.GET)
	public void dealDeleteForm(HttpServletRequest request, Model model, int board_num) {
		System.out.println("deleteDeal 동작함");
		model.addAttribute("board_num",board_num);
	}
	*/
	
	// 찾아요게시판 삭제 컨트롤러
	@RequestMapping("/deleteFind.do")
	public ModelAndView findDeleteSubmit(HttpServletRequest request, int board_num) {
		String path = request.getRealPath("/resources/img");
		ModelAndView mav = new ModelAndView("redirect:/find.do");
		String picture_fname = dao.getFind(board_num).getPicture_fname();
		
		int re = dao.deleteFind(board_num);
		System.out.println(re);
		if(re == 1) {
			File file = new File(path + "/" + picture_fname);
			file.delete();
		}else {
			mav.addObject("msg","게시물 삭제에 실패하였습니다.");
			mav.setViewName("find.do");
		}
		return mav;
	}
}