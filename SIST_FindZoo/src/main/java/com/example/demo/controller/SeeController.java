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
import com.example.demo.util.Paging;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.PetVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.SeeVo;

@Controller
public class SeeController {

	@Autowired
	private SeeDao dao;

	public void setDao(SeeDao dao) {
		this.dao = dao;
	}

	@Autowired
	private Paging paging;

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	// 목격했어요 게시판, 댓글 목록 컨트롤러
	@RequestMapping("/see.do")
	public void see(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			Model model) {

		paging.totalRecord = dao.getTotalRecordSee();
		paging.totalPage = paging.getTotalPage();
		paging.start = paging.getStart(pageNum);
		paging.end = paging.getEnd(paging.start, pageNum);
		paging.pageNum = pageNum;
		paging.listStart = paging.getListStart(pageNum);
		paging.listEnd = paging.getListEnd();

		if (paging.end > paging.totalRecord) {
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

	// 목격했어요 게시판 검색 후 목록 출력
	@RequestMapping(value = "/searchSee.do")
	public void searchSee(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "search_option", defaultValue = "title") String search_option,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, Model model) {
		HashMap num_map = new HashMap();
		num_map.put("keyword", keyword);
		num_map.put("search_option", search_option);
		paging.searchRecord = dao.getSearchRecordSee(num_map);
		paging.searchPage = paging.getSearchPage();
		paging.start = paging.getStart(pageNum);
		paging.end = paging.getEnd(paging.start, pageNum);
		paging.pageNum = pageNum;
		paging.s_listStart = paging.getS_ListStart(pageNum);
		paging.s_listEnd = paging.getS_ListEnd();

		if (paging.end > paging.searchRecord) {
			paging.end = paging.searchRecord;
		}

		HashMap map = new HashMap();
		map.put("start", paging.start);
		map.put("end", paging.end);
		map.put("keyword", keyword);
		map.put("search_option", search_option);

		model.addAttribute("list", dao.searchSee(map));
		model.addAttribute("searchPage", paging.searchPage);
		model.addAttribute("searchRecord", paging.searchRecord);
		model.addAttribute("pageNum", paging.pageNum);
		model.addAttribute("s_listStart", paging.s_listStart);
		model.addAttribute("s_listEnd", paging.s_listEnd);
		model.addAttribute("search_option", search_option);
		model.addAttribute("keyword", keyword);
	}

	// 목격했어요 게시판 상세보기 컨트롤러
	@RequestMapping("/detailSee.do")
	public void detail(HttpServletRequest request, Model model, HttpSession session, int board_num) {
		dao.updateViewsSee(board_num);
		int member_num = 0;
		if (((MemberVo) session.getAttribute("loginM")) != null) {
			member_num = ((MemberVo) session.getAttribute("loginM")).getMember_num();
		}
		model.addAttribute("s", dao.getSee(board_num));
		model.addAttribute("list", dao.findAll(board_num));
		model.addAttribute("member_num", member_num);
	}

	// 목격했어요 게시판 글작성 컨트롤러
	@RequestMapping(value = "/member/insertSee.do", method = RequestMethod.GET)
	public void form(HttpServletRequest request, HttpSession session) {
	}

	@RequestMapping(value = "/member/insertSee.do", method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, HttpSession session, SeeVo s) {
		ModelAndView mav = new ModelAndView("redirect:/see.do");
		int member_num = ((MemberVo) session.getAttribute("loginM")).getMember_num();
		s.setMember_num(member_num);
		String path = request.getRealPath("resources/img");
		String picture_fname = null;
		int fsize = 0;

		MultipartFile picture_file = s.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		if (picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date)) + "_" + picture_fname;
				byte[] data = picture_file.getBytes();
				fsize = data.length;
				s.setPicture_fname(picture_fname);
				FileOutputStream fos = new FileOutputStream(path + "/" + picture_fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("파일업로드중 오류발생 : " + e.getMessage());
			}
		} else {
			s.setPicture_fname("");
		}

		int re = dao.insertSee(s);
		if (re != 1) {
			mav.addObject("msg", "글쓰기에 실패하였습니다.");
			mav.setViewName("redirect:/see.do");
		}
		return mav;
	}

	// 목격했어요 게시판 수정 컨트롤러
	@RequestMapping(value = "/member/updateSee.do", method = RequestMethod.GET)
	public void seeUpdateForm(HttpServletRequest request, Model model, int board_num) {
		model.addAttribute("s", dao.getSee(board_num));
	}

	@RequestMapping(value = "/member/updateSee.do", method = RequestMethod.POST)
	public ModelAndView seeUpdateSubmit(HttpServletRequest request, SeeVo s) {
		ModelAndView mav = new ModelAndView("redirect:/detailSee.do?board_num=" + s.getBoard_num());
		String path = request.getRealPath("/resources/img");
		String oldFname = s.getPicture_fname();
		int fsize = 0;

		String picture_fname = null;

		MultipartFile picture_file = s.getPicture_file();
		picture_fname = picture_file.getOriginalFilename();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		if (picture_fname != null && !picture_fname.equals("")) {
			try {
				picture_fname = (new SimpleDateFormat("yyyyMMdd-HHmmss").format(date)) + "_" + picture_fname;
				byte[] data = picture_file.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + picture_fname);
				fos.write(data);
				fos.close();
				s.setPicture_fname(picture_fname);

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("예외발생:" + e.getMessage());
			}
		}

		int re = dao.updateSee(s);
		if (re != 1) {
			mav.addObject("msg", "게시물 수정에 실패하였습니다.");
			mav.setViewName("/see.do");
		} else {
			if (fsize != 0) {
				File file = new File(path + "/" + oldFname);
				file.delete();
			}
		}
		return mav;
	}

	// 목격했어요 게시판 삭제 컨트롤러
	@RequestMapping("/deleteSee.do")
	public ModelAndView seeDeleteSubmit(HttpServletRequest request, int board_num) {
		String path = request.getRealPath("/resources/img");
		ModelAndView mav = new ModelAndView("redirect:/see.do");
		String picture_fname = dao.getSee(board_num).getPicture_fname();

		int re = dao.deleteSee(board_num);
		System.out.println(re);
		if (re == 1) {
			File file = new File(path + "/" + picture_fname);
			file.delete();
		} else {
			mav.addObject("msg", "게시물 삭제에 실패하였습니다.");
			mav.setViewName("see.do");
		}
		return mav;
	}

	//목격했어요 게시판 댓글쓰기 컨트롤러
	@RequestMapping(value = "/member/seeInsertReply.do", method = RequestMethod.GET)
	public void formReply(HttpServletRequest request, HttpSession session) {

	}

	@RequestMapping(value = "/member/seeInsertReply.do", method = RequestMethod.POST)
	public ModelAndView insertReplySubmit(ReplyVo r, int board_num) {

		ModelAndView mav = new ModelAndView("redirect:/detailSee.do?board_num=" + board_num);

		int re = dao.insertReply(r);
		if (re != 1) {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}

		return mav;
	}

	//목격했어요 게시판 댓글삭제 컨트롤러
	@RequestMapping(value = "/dealDeleteReply.do")
	public ModelAndView deleteReplySubmit(int reply_num, int board_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num=" + board_num);
		int re = dao.deleteReply(reply_num);
		if (re != 1) {
			mav.addObject("msg", "댓글 삭제에 실패하였습니다..");
			mav.setViewName("error");
		}
		return mav;
	}

	// 목격했어요 게시판 댓글 수정
	@RequestMapping(value = "/member/dealUpdateReply.do", method = RequestMethod.GET)
	public void formReplyUpdate(HttpServletRequest request, HttpSession session) {

	}

	@RequestMapping(value = "/member/dealUpdateReply.do", method = RequestMethod.POST)
	public ModelAndView updateReplySubmit(ReplyVo r, int board_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num=" + board_num);
		int re = dao.updateReply(r);
		if (re != 1) {
			mav.addObject("msg", "내 댓글 수정에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	// 목격했어요 게시판 대댓글쓰기
	@RequestMapping(value = "/member/dealReReply.do", method = RequestMethod.GET)
	public void formReReply(HttpServletRequest request, HttpSession session) {

	}

	@RequestMapping(value = "/member/dealReReply.do", method = RequestMethod.POST)
	public ModelAndView insertReReplySubmit(ReplyVo r, int board_num, int reply_num) {
		ModelAndView mav = new ModelAndView("redirect:/detailDeal.do?board_num=" + board_num);

		int re = dao.insertReReply(r);

		if (re != 1) {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}

		return mav;
	}
}