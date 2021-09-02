package com.example.demo.vo;

import java.util.Date;

public class NoteVo {

	private int note_num;
	private String note_content;
	private Date note_date;
	private int note_sender_num;
	private int note_receiver_num;
	
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
	public Date getNote_date() {
		return note_date;
	}
	public void setNote_date(Date note_date) {
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
	
	public NoteVo(int note_num, String note_content, Date note_date, int note_sender_num, int note_receiver_num) {
		super();
		this.note_num = note_num;
		this.note_content = note_content;
		this.note_date = note_date;
		this.note_sender_num = note_sender_num;
		this.note_receiver_num = note_receiver_num;
	}
	
	public NoteVo() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
}