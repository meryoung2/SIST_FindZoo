package com.example.demo.vo;

public class NoteVo {

	// note 테이블
	private int note_num;
	private String note_content;
	private String note_date;
	private int note_sender_num;
	private int note_receiver_num;
	// SQL join, 사이드바를 위한 일부 member 테이블 컬럼
	private int member_num;
	private String member_id;
	private String member_pwd;
	private String member_nick;
	
	public int getNote_num() {
		return note_num;
	}
	public void setNote_num(int note_num) {
		this.note_num = note_num;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	public String getNote_date() {
		return note_date;
	}
	public void setNote_date(String note_date) {
		this.note_date = note_date;
	}
	public int getNote_sender_num() {
		return note_sender_num;
	}
	public void setNote_sender_num(int note_sender_num) {
		this.note_sender_num = note_sender_num;
	}
	public int getNote_receiver_num() {
		return note_receiver_num;
	}
	public void setNote_receiver_num(int note_receiver_num) {
		this.note_receiver_num = note_receiver_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	
	public NoteVo(int note_num, String note_content, String note_date, int note_sender_num, int note_receiver_num,
			int member_num, String member_id, String member_pwd, String member_nick) {
		super();
		this.note_num = note_num;
		this.note_content = note_content;
		this.note_date = note_date;
		this.note_sender_num = note_sender_num;
		this.note_receiver_num = note_receiver_num;
		this.member_num = member_num;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_nick = member_nick;
	}
	
	public NoteVo() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
}