package com.example.demo.vo;

import java.util.Date;

public class MyReplyVo {
	
	private int reply_num;
	private String reply_content;
	private String reply_date;
	private int member_num;
	private int board_num;
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	public MyReplyVo(int reply_num, String reply_content, String reply_date, int member_num, int board_num) {
		super();
		this.reply_num = reply_num;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.member_num = member_num;
		this.board_num = board_num;
	}
	
	public MyReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}