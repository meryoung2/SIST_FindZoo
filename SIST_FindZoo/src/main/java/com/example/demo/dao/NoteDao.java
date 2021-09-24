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
	
	// 보낸 쪽지 내용 상세 조회 + 해당 쪽지를 받는 사람의 닉네임
	public NoteVo detailSendNote(int note_num) {
		return DBManager.detailSendNote(note_num);
	}
	
	// 보낸 쪽지함에서 쪽지 선택 삭제시, 해당 쪽지의 note_send_visibility를 0으로 변경하여 보낸 쪽지함 목록에서 제외
	public int hideSendNoteArray(int note_num) {
		return DBManager.hideSendNoteArray(note_num);
	}
	
	// 받은 쪽지함 
	public List<NoteVo> receiveNoteList(int note_receiver_num) {
		return DBManager.receiveNoteList(note_receiver_num);
	}
	
	// 받은 쪽지 내용 상세 조회 + 해당 쪽지를 보낸(답장시 쪽지를 받을) 사람의 닉네임
	public NoteVo detailReceiveNote(int note_num) {
		return DBManager.detailReceiveNote(note_num);
	}
	
	// 받은 쪽지 답장
	public int sendReplyNote(NoteVo nt) {
		return DBManager.sendReplyNote(nt);
	}
	
	// 새로운 쪽지 보내기
	public int sendNewNote(NoteVo nt) {
		return DBManager.sendNewNote(nt);
	}
	
	// 멤버 번호를 통해 멤버 닉네임 조회
	public String getMemberNick(int member_num) {
		return DBManager.getMemberNick(member_num);
	}
	
	// 받은 쪽지함에서 쪽지 선택 삭제시, 해당 쪽지의 note_receive_visibility를 0으로 변경하여 받은 쪽지함 목록에서 제외
	public int hideReceiveNoteArray(int note_num) {
		return DBManager.hideReceiveNoteArray(note_num);
	}
	
}