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
import com.example.demo.util.Paging;
import com.example.demo.vo.FreeVo;
import com.example.demo.vo.ReplyVo;

@Controller
public class FreeController {
	
	@Autowired
	private FreeDao dao;

	public void setDao(FreeDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private Paging paging;
	
	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	// 자유게시판 목록
	@RequestMapping("/free.do")
	public void list(HttpServletRequest request ,@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		
		paging.totalRecord = dao.getTotalRecordFree();
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
	}
	
	// 자유게시판 검색 후 목록
	@RequestMapping(value = "/searchFree.do")
	public void searchFree(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "search_option", defaultValue = "title") String search_option, @RequestParam(value = "keyword", defaultValue = "") String keyword, Model model) {
		HashMap num_map = new HashMap();
		num_map.put("keyword", keyword);
		num_map.put("search_option", search_option);
		paging.searchRecord = dao.getSearchRecordFree(num_map);
		paging.searchPage = paging.getSearchPage();
		paging.start = paging.getStart(pageNum);
		paging.end = paging.getEnd(paging.start, pageNum);
		paging.pageNum = pageNum;
		paging.s_listStart = paging.getS_ListStart(pageNum);
		paging.s_listEnd = paging.getS_ListEnd();
		
		if(paging.end > paging.searchRecord) {
			paging.end = paging.searchRecord;
		}
		
		HashMap map = new HashMap();
		map.put("start", paging.start);
		map.put("end", paging.end);
		map.put("keyword", keyword);
		map.put("search_option", search_option);
				
		model.addAttribute("list", dao.searchFree(map));
		model.addAttribute("searchPage", paging.searchPage);
		model.addAttribute("searchRecord", paging.searchRecord);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("s_listStart", paging.s_listStart);
		model.addAttribute("s_listEnd", paging.s_listEnd);
		model.addAttribute("search_option", search_option);		
		model.addAttribute("keyword", keyword);		
	}
	
	// 자유게시판 글 상세내용
	@RequestMapping("/detailFree.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		dao.updateViews(board_num);
		model.addAttribute("f", dao.getFree(board_num));
		model.addAttribute("list", dao.findAll(board_num));
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
		int fsize = 0;
		
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
				fsize = data.length;
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
			if(fsize != 0) {
				File file = new File(path+"/"+old_picture_fname);
				file.delete();
			}				
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
	
	
	//댓글쓰기 컨트롤러
		@RequestMapping(value="/freeInsertReply.do", method=RequestMethod.POST)
		public ModelAndView insertReplySubmit(ReplyVo r, int board_num) {
			
			ModelAndView mav = new ModelAndView("redirect:/detailFree.do?board_num="+board_num);
		
			int re = dao.insertReply(r);
			if(re != 1) {
				mav.addObject("msg", "게시물 등록에 실패하였습니다.");
				mav.setViewName("error");
			}
			
			return mav;
		}
		
		//댓글삭제 컨트롤러	
		@RequestMapping(value="/freeDeleteReply.do")
		public ModelAndView deleteReplySubmit(int reply_num, int board_num) {
			ModelAndView mav = new ModelAndView("redirect:/detailFree.do?board_num="+board_num);
			int re = dao.deleteReply(reply_num);
			if(re != 1) {
				mav.addObject("msg", "댓글 삭제에 실패하였습니다..");
				mav.setViewName("error");
			}
			return mav;
		}
		
			
		//댓글 수정
		@RequestMapping(value="/freeUpdateReply.do", method=RequestMethod.POST)
		public ModelAndView updateReplySubmit(ReplyVo r, int board_num) {
			ModelAndView mav = new ModelAndView("redirect:/detailFree.do?board_num="+board_num);
			int re = dao.updateReply(r);
			if(re != 1) {
				mav.addObject("msg", "내 댓글 수정에 실패하였습니다.");
				mav.setViewName("error");
			}
			return mav;
		}
		
		//대댓글쓰기		
		@RequestMapping(value="/freeReReply.do", method=RequestMethod.POST)
		public ModelAndView insertReReplySubmit(ReplyVo r, int board_num, int reply_num) {
			ModelAndView mav = new ModelAndView("redirect:/detailFree.do?board_num="+board_num);
			
			int re = dao.insertReReply(r);
			
			if(re != 1) {
				mav.addObject("msg", "게시물 등록에 실패하였습니다.");
				mav.setViewName("error");
			}
			
			return mav;
		}
}