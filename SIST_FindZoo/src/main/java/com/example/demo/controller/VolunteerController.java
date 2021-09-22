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
import com.example.demo.dao.SeeDao;
import com.example.demo.dao.VolunteerDao;
import com.example.demo.util.Paging;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.PetVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.SeeVo;
import com.example.demo.vo.VolunteerVo;


@Controller
public class VolunteerController {
	
	@Autowired
	private VolunteerDao dao;
	public void setDao(VolunteerDao dao) {
		this.dao = dao;
	}

	@Autowired
	private Paging paging;
	
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	// 자원봉사 게시판, 댓글 목록 컨트롤러
	@RequestMapping("/vol.do")
	public void vol(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {

		paging.totalRecord = dao.getTotalRecordVol();
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
	
	// 자원봉사 게시판 검색 후 목록 출력
	@RequestMapping(value = "/searchVol.do")
	public void searchVol(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "search_option", defaultValue = "title") String search_option, @RequestParam(value = "keyword", defaultValue = "") String keyword, Model model) {
		HashMap num_map = new HashMap();
		num_map.put("keyword", keyword);
		num_map.put("search_option", search_option);
		paging.searchRecord = dao.getSearchRecordVol(num_map);
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
				
		model.addAttribute("list", dao.searchVol(map));
		model.addAttribute("searchPage", paging.searchPage);
		model.addAttribute("searchRecord", paging.searchRecord);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("s_listStart", paging.s_listStart);
		model.addAttribute("s_listEnd", paging.s_listEnd);
		model.addAttribute("search_option", search_option);		
		model.addAttribute("keyword", keyword);		
	}
	
	// 자원봉사 게시판 상세보기 컨트롤러
	@RequestMapping("/detailVol.do")
	public void detail(HttpServletRequest request, Model model, int board_num) {
		dao.updateViewsVol(board_num);
		model.addAttribute("v", dao.getvol(board_num));
		model.addAttribute("list", dao.findAll(board_num));
	}
	
	// 자원봉사 게시판 글작성 컨트롤러
	@RequestMapping(value = "/insertVol.do", method = RequestMethod.GET)
	public void form(HttpServletRequest request) {}
	
	@RequestMapping(value = "/insertVol.do" , method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, VolunteerVo v) {
		ModelAndView mav = new ModelAndView("redirect:/vol.do");
		String path = request.getRealPath("resources/img");		
		String picture_fname = null;
		int fsize = 0;
		
		MultipartFile picture_file = v.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		if(picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date))+"_"+picture_fname;
				byte[] data = picture_file.getBytes();
				fsize = data.length;
				v.setPicture_fname(picture_fname);
				FileOutputStream fos = new FileOutputStream(path+"/"+picture_fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("파일업로드중 오류발생 : " + e.getMessage());
			}
		}else {
			v.setPicture_fname("");
		}
		
		int re = dao.insertVol(v);
		if(re != 1) {
			mav.addObject("msg","글쓰기에 실패하였습니다.");
			mav.setViewName("redirect:/vol.do");
		}
		return mav;
	}
	
	// 자원봉사 게시판 수정 컨트롤러
	@RequestMapping(value = "/updateVol.do", method = RequestMethod.GET)
	public void volUpdateForm(HttpServletRequest request, Model model, int board_num) {
		model.addAttribute("v", dao.getvol(board_num));
	}
	
	@RequestMapping(value = "/updateVol.do", method = RequestMethod.POST)
	public ModelAndView volUpdateSubmit(HttpServletRequest request, VolunteerVo v) {
		ModelAndView mav = new ModelAndView("redirect:/detailVol.do?board_num="+v.getBoard_num());
		String path = request.getRealPath("/resources/img");
		String oldFname = v.getPicture_fname();
		int fsize = 0;
		
		String picture_fname = null;
		
		MultipartFile picture_file = v.getPicture_file();
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
				v.setPicture_fname(picture_fname);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("예외발생:"+ e.getMessage());
			}
		}
		
		int re = dao.updateVol(v);
		if(re != 1) {
			mav.addObject("msg", "게시물 수정에 실패하였습니다.");
			mav.setViewName("/vol.do");
		}else {
			if(fsize != 0) {
				File file = new File(path + "/" + oldFname);
				file.delete();
			}
		}
		return mav;
	}
	
	// 자원봉사 게시판 삭제 컨트롤러
	@RequestMapping("/deleteVol.do")
	public ModelAndView volDeleteSubmit(HttpServletRequest request, int board_num) {
		String path = request.getRealPath("/resources/img");
		ModelAndView mav = new ModelAndView("redirect:/vol.do");
		String picture_fname = dao.getvol(board_num).getPicture_fname();
		
		int re = dao.deleteVol(board_num);
		System.out.println(re);
		if(re == 1) {
			File file = new File(path + "/" + picture_fname);
			file.delete();
		}else {
			mav.addObject("msg","게시물 삭제에 실패하였습니다.");
			mav.setViewName("vol.do");
		}
		return mav;
	}	
	
	
	//자원봉사 게시판 댓글쓰기 컨트롤러
	@RequestMapping(value="/volInsertReply.do", method=RequestMethod.POST)
	public ModelAndView insertReplySubmit(ReplyVo r, int board_num) {
		
		ModelAndView mav = new ModelAndView("redirect:/detailVol.do?board_num="+board_num);
	
		int re = dao.insertReply(r);
		if(re != 1) {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	// 자원봉사 게시판 댓글삭제 컨트롤러	
	@RequestMapping(value="/volDeleteReply.do")
	public ModelAndView deleteReplySubmit(int reply_num, int board_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailVol.do?board_num="+board_num);
		int re = dao.deleteReply(reply_num);
		if(re != 1) {
			mav.addObject("msg", "댓글 삭제에 실패하였습니다..");
			mav.setViewName("error");
		}
		return mav;
	}
	
		
	// 자원봉사 게시판 댓글 수정
	@RequestMapping(value="/volUpdateReply.do", method=RequestMethod.POST)
	public ModelAndView updateReplySubmit(ReplyVo r, int board_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailVol.do?board_num="+board_num);
		int re = dao.updateReply(r);
		if(re != 1) {
			mav.addObject("msg", "내 댓글 수정에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	// 자원봉사 게시판 대댓글쓰기
	@RequestMapping(value="/volReReply.do", method=RequestMethod.POST)
	public ModelAndView insertReReplySubmit(ReplyVo r, int board_num, int reply_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailVol.do?board_num="+board_num);
		
		int re = dao.insertReReply(r);
		
		if(re != 1) {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		
		return mav;
	}
}