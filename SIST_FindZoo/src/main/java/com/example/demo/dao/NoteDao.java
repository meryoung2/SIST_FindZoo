package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;


import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.NoteVo;
import com.example.demo.vo.PetVo;

@Repository
public class NoteDao {

	// 보낸 쪽지함
	public List<NoteVo> sendNoteList(int note_sender_num) {
		return DBManager.sendNoteList(note_sender_num);
	}
	
	// 보낸 쪽지함 사이드바 링크 연결을 위한 member_num, member_pwd
	public NoteVo getSenderInfo(int note_sender_num) {
		return DBManager.getSenderInfo(note_sender_num);
	}
	
	// 받은 쪽지함 
	public List<NoteVo> receiveNoteList(int note_receiver_num) {
		return DBManager.receiveNoteList(note_receiver_num);
	}
	
	// 받은 쪽지함 사이드바 링크 연결을 위한 member_num, member_pwd
	public NoteVo getReceiverInfo(int note_receiver_num) {
		return DBManager.getReceiverInfo(note_receiver_num);
	}
	
	// 보낸 쪽지 내용 상세 조회 + 해당 쪽지를 받는 사람의 정보
	public NoteVo detailSendNote(int note_num) {
		return DBManager.detailSendNote(note_num);
	}
	
	// 받은 쪽지 내용 상세 조회 + 해당 쪽지를 보낸(답장시 쪽지를 받을) 사람의 정보
	public NoteVo detailReceiveNote(int note_num) {
		return DBManager.detailReceiveNote(note_num);
	}
	
	// 받은 쪽지 답장
	public int sendReplyNote(NoteVo nt) {
		return DBManager.sendReplyNote(nt);
	}
	
	/* 해당 쪽지 삭제
	public int deleteNote(int note_num) {
		return DBManager.deleteNote(note_num);
	} */
	
	// 보낸 쪽지함에서 쪽지 선택 삭제시, 보낸 사람의 회원번호를 관리자 번호인 -1로 변경하여 보낸 쪽지함 목록에서 제외
	public int deleteChangeSenderNum(int note_num) {
		return DBManager.deleteChangeSenderNum(note_num);
	}
	
	// 받은 쪽지함에서 쪽지 선택 삭제시, 받은 사람의 회원번호를 관리자 번호인 -1로 변경하여 받은 쪽지함 목록에서 제외
	public int deleteChangeReceiverNum(int note_num) {
		return DBManager.deleteChangeReceiverNum(note_num);
	}
	
}