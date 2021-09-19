package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.dao.NoteDao;
import com.example.demo.vo.NoteVo;

@Controller
public class NoteController {
	
	@Autowired
	private NoteDao dao;

	public void setDao(NoteDao dao) {
		this.dao = dao;
	}

	// 보낸 쪽지함
	@RequestMapping("/sendNoteList.do")
	public void sendNoteList(int note_sender_num, Model model) {
		model.addAttribute("list", dao.sendNoteList(note_sender_num));
		// 보낸 쪽지함 사이드바 링크 연결을 위한 member_num, member_pwd
		model.addAttribute("n", dao.getSenderInfo(note_sender_num));
	}

	// 받은 쪽지함
	@RequestMapping("/receiveNoteList.do")
	public void receiveNoteList(int note_receiver_num, Model model) {
		model.addAttribute("list", dao.receiveNoteList(note_receiver_num));
		// 받은 쪽지함 사이드바 링크 연결을 위한 member_num, member_pwd
		model.addAttribute("n", dao.getReceiverInfo(note_receiver_num));
	}
	
	// 보낸 쪽지 내용 상세 조회 + 해당 쪽지를 받는 사람의 정보
	@RequestMapping("/detailSendNote.do")
	public void detailSendNote(int note_num, Model model) {
		model.addAttribute("nt", dao.detailSendNote(note_num));
	}
	
	// 받은 쪽지 내용 상세 조회 + 해당 쪽지를 보낸(답장시 쪽지를 받을) 사람의 정보
	@RequestMapping("/detailReceiveNote.do")
	public void detailReceiveNote(int note_num, Model model) {
		model.addAttribute("nt", dao.detailReceiveNote(note_num));
	}
	
	// 받은 쪽지 답장
	@RequestMapping(value = "/sendReplyNote.do", method = RequestMethod.GET)
	public void sendReplyNoteForm(int note_num, Model model) {
		// 쪽지 답장시 필요한 값들을 전달
		model.addAttribute("nt", dao.detailReceiveNote(note_num));
	}
	@RequestMapping(value = "/sendReplyNote.do", method = RequestMethod.POST)
	public ModelAndView sendReplyNoteSubmit(NoteVo nt) {
		ModelAndView mav = new ModelAndView("redirect:/sendNoteList.do?note_sender_num="+nt.getNote_sender_num());
		int re = dao.sendReplyNote(nt);
		if(re != 1) {
			mav.addObject("msg", "쪽지 전송에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	} 
	
	/* 쪽지 삭제
	@RequestMapping(value = "/deleteNote.do", method = RequestMethod.POST)
	@ResponseBody
	public int deleteNote(@RequestParam(value = "checkedArr[]") List<String> chkArr, NoteVo nt) {
		System.out.println("deleteNote POST 컨트롤러까지 옴");
		int re = 0;
		int note_num = 0;
		for(String i : chkArr) {
			note_num = Integer.parseInt(i);
			nt.setNote_num(note_num);
			dao.deleteNote(note_num);
		}
		re = 1;
		return re;		
	} */
	
	// 보낸 쪽지함에서 쪽지 선택 삭제시, 보낸 사람의 회원번호를 관리자 번호인 -1로 변경하여 보낸 쪽지함 목록에서 제외
	@RequestMapping(value = "/deleteChangeSenderNum.do", method = RequestMethod.POST)
	@ResponseBody
	public int deleteChangeSenderNum(@RequestParam(value = "checkedArr[]") List<String> chkArr, NoteVo nt) {
		int re = 0;
		int note_num = 0;
		for(String i : chkArr) {
			note_num = Integer.parseInt(i);
			nt.setNote_num(note_num);
			dao.deleteChangeSenderNum(note_num);
		}
		re = 1;
		return re;		
	}
	
	// 받은 쪽지함에서 쪽지 선택 삭제시, 받은 사람의 회원번호를 관리자 번호인 -1로 변경하여 받은 쪽지함 목록에서 제외
	@RequestMapping(value = "/deleteChangeReceiverNum.do", method = RequestMethod.POST)
	@ResponseBody
	public int deleteChangeReceiverNum(@RequestParam(value = "checkedArr[]") List<String> chkArr, NoteVo nt) {
		int re = 0;
		int note_num = 0;
		for(String i : chkArr) {
			note_num = Integer.parseInt(i);
			nt.setNote_num(note_num);
			dao.deleteChangeReceiverNum(note_num);
		}
		re = 1;
		return re;		
	}

}