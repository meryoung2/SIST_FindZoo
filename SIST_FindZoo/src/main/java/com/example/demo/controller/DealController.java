package com.example.demo.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DealDao;
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

	
	// 거래게시판, 댓글 목록 컨트롤러
	@RequestMapping("/deal.do")
	public void deal(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {

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

	}
	
	// 거래게시판 검색 후 목록 컨트롤러
	// 거래게시판 검색에 필요한 셀렉트에서 작성자를 기본값으로 하는 search_option과 
	// 사용자가 입력할 검색어를 받는(기본값이 공란이라 ""임) keyword를 매개변수로 전달받은 후
	// hash메소드를 통해 map이라는 변수에 담고 model객체를 통해 searchDeal메소드를 호출한다.
	@RequestMapping("/searchDeal.do")
	public void searchDeal(HttpServletRequest request, 
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			@RequestParam(defaultValue = "member_nick") String search_option, 
			@RequestParam(defaultValue = "") String keyword) {
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
		map.put("keyword", keyword);
		map.put("search_option", search_option);
		
		model.addAttribute("list",dao.searchDeal(map));
		model.addAttribute("totalPage", DealDao.totalPage);
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
		System.out.println(path);
		
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
			d.setPicture_fname("null");
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
				File file = new File(path + "/" + oldFname);
				file.delete();
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
			mav.setViewName("listDeal.do");
		}
		return mav;
	}	
	
	
	//거래게시판 댓글쓰기 컨트롤러
	@RequestMapping(value="/insertReply.do", method=RequestMethod.POST)
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
	@RequestMapping(value="/deleteReply.do")
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
	@RequestMapping(value="/updateReply.do", method=RequestMethod.POST)
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
	@RequestMapping(value="/reReply.do", method=RequestMethod.POST)
	public ModelAndView insertReReplySubmit(ReplyVo r, int board_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num="+board_num);
		
		int re = dao.insertReReply(r);
		
		if(re != 1) {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		
		return mav;
	}
}