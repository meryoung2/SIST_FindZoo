package com.example.demo.vo;

public class NoteVo {

	private int note_num;
	private String note_content;
	private String note_date;
	private int note_sender_num;
	private int note_receiver_num;
	private int note_send_visibility;
	private int note_receive_visibility;
	private int member_num;
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
	public int getNote_send_visibility() {
		return note_send_visibility;
	}
	public void setNote_send_visibility(int note_send_visibility) {
		this.note_send_visibility = note_send_visibility;
	}
	public int getNote_receive_visibility() {
		return note_receive_visibility;
	}
	public void setNote_receive_visibility(int note_receive_visibility) {
		this.note_receive_visibility = note_receive_visibility;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	
	public NoteVo(int note_num, String note_content, String note_date, int note_sender_num, int note_receiver_num,
			int note_send_visibility, int note_receive_visibility, int member_num, String member_nick) {
		super();
		this.note_num = note_num;
		this.note_content = note_content;
		this.note_date = note_date;
		this.note_sender_num = note_sender_num;
		this.note_receiver_num = note_receiver_num;
		this.note_send_visibility = note_send_visibility;
		this.note_receive_visibility = note_receive_visibility;
		this.member_num = member_num;
		this.member_nick = member_nick;
	}
	
	public NoteVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}