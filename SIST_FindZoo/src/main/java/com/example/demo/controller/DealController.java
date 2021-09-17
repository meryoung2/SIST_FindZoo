package com.example.demo.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DealDao;
import com.example.demo.util.Paging;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.PetVo;
import com.example.demo.vo.ReplyVo;


@Controller
public class DealController {
	
	@Autowired
	private DealDao dao;
	public void setDao(DealDao dao) {
		this.dao = dao;
	}

	@Autowired
	private Paging paging;
	
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	// 거래게시판, 댓글 목록 컨트롤러
	@RequestMapping("/deal.do")
	public void deal(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {

		paging.totalRecord = dao.getTotalRecordDeal();
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
	
	// 거래게시판 검색 후 목록 출력
	@RequestMapping(value = "/searchDeal.do")
	public void searchFree(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "search_option", defaultValue = "title") String search_option, @RequestParam(value = "keyword", defaultValue = "") String keyword, Model model) {
		HashMap num_map = new HashMap();
		num_map.put("keyword", keyword);
		num_map.put("search_option", search_option);
		paging.searchRecord = dao.getSearchRecordDeal(num_map);
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
				
		model.addAttribute("list", dao.searchDeal(map));
		model.addAttribute("searchPage", paging.searchPage);
		model.addAttribute("searchRecord", paging.searchRecord);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("s_listStart", paging.s_listStart);
		model.addAttribute("s_listEnd", paging.s_listEnd);
		model.addAttribute("search_option", search_option);		
		model.addAttribute("keyword", keyword);		
	}
	
	// 거래게시판 상세보기 컨트롤러
	@RequestMapping("/detailDeal.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		dao.updateViewsDeal(board_num);
		model.addAttribute("d", dao.getDeal(board_num));
		model.addAttribute("list", dao.findAll(board_num));
	}
	
	// 거래게시판 글작성 컨트롤러
	@RequestMapping(value = "/insertDeal.do", method = RequestMethod.GET)
	public void form(HttpServletRequest request) {}
	
	@RequestMapping(value = "/insertDeal.do" , method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, DealVo d) {
		ModelAndView mav = new ModelAndView("redirect:/deal.do");
		String path = request.getRealPath("resources/img");		
		String picture_fname = null;
		int fsize = 0;
		
		MultipartFile picture_file = d.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname;
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
			mav.setViewName("redirect:/deal.do");
		}
		return mav;
	}
	
	// 거래게시판 수정 컨트롤러
	@RequestMapping(value = "/updateDeal.do", method = RequestMethod.GET)
	public void dealUpdateForm(HttpServletRequest request, Model model, int board_num) {
		model.addAttribute("d", dao.getDeal(board_num));
	}
	
	@RequestMapping(value = "/updateDeal.do", method = RequestMethod.POST)
	public ModelAndView dealUpdateSubmit(HttpServletRequest request, DealVo d) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num="+d.getBoard_num());
		String path = request.getRealPath("/resources/img");
		String oldFname = d.getPicture_fname();
		int fsize = 0;
		
		String picture_fname = null;
		
		MultipartFile picture_file = d.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date)) + "_" + picture_fname;
				byte []data = picture_file.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + picture_fname);
				fos.write(data);
				fos.close();
				d.setPicture_fname(picture_fname);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("예외발생:"+ e.getMessage());
			}
		}
		
		int re = dao.updateDeal(d);
		if(re != 1) {
			mav.addObject("msg", "게시물 수정에 실패하였습니다.");
			mav.setViewName("/deal.do");
		}else {
			if(fsize != 0) {
				File file = new File(path + "/" + oldFname);
				file.delete();
			}
		}
		return mav;
	}
	
	// 거래게시판 삭제 컨트롤러
	@RequestMapping("/deleteDeal.do")
	public ModelAndView dealDeleteSubmit(HttpServletRequest request, int board_num) {
		String path = request.getRealPath("/resources/img");
		ModelAndView mav = new ModelAndView("redirect:/deal.do");
		String picture_fname = dao.getDeal(board_num).getPicture_fname();
		
		int re = dao.deleteDeal(board_num);
		System.out.println(re);
		if(re == 1) {
			File file = new File(path + "/" + picture_fname);
			file.delete();
		}else {
			mav.addObject("msg","게시물 삭제에 실패하였습니다.");
			mav.setViewName("deal.do");
		}
		return mav;
	}	
	
	
	//거래게시판 댓글쓰기 컨트롤러
	@RequestMapping(value="/dealInsertReply.do", method=RequestMethod.POST)
	public ModelAndView insertReplySubmit(ReplyVo r, int board_num) {
		
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num="+board_num);
	
		int re = dao.insertReply(r);
		if(re != 1) {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	//거래게시판 댓글삭제 컨트롤러	
	@RequestMapping(value="/dealDeleteReply.do")
	public ModelAndView deleteReplySubmit(int reply_num, int board_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num="+board_num);
		int re = dao.deleteReply(reply_num);
		if(re != 1) {
			mav.addObject("msg", "댓글 삭제에 실패하였습니다..");
			mav.setViewName("error");
		}
		return mav;
	}
	
		
	//댓글 수정
	@RequestMapping(value="/dealUpdateReply.do", method=RequestMethod.POST)
	public ModelAndView updateReplySubmit(ReplyVo r, int board_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num="+board_num);
		int re = dao.updateReply(r);
		if(re != 1) {
			mav.addObject("msg", "내 댓글 수정에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	//거래게시판 대댓글쓰기
	
	@RequestMapping(method = RequestMethod.GET)
	public void form(Model model, @RequestParam(value = "reply_num", defaultValue = "0")  int reply_num) {
		// int no = Integer.parseInt(request.getParamter("no"));
		model.addAttribute("reply_num", reply_num);
	}
	
	@RequestMapping(value="/dealReReply.do", method=RequestMethod.POST)
	public ModelAndView insertReReplySubmit(ReplyVo r, int board_num, int reply_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num="+board_num);
		
		int re = dao.insertReReply(r);
		
		if(re != 1) {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		
		return mav;
	}
}