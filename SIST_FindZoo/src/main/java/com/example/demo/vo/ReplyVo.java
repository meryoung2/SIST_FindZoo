package com.example.demo.vo;

import java.util.Date;

public class ReplyVo {
	private int reply_num;
	private int reply_ref;
	private int reply_level;
	private int reply_step;
	private String reply_content;
	private Date reply_date;
	private int member_num;
	private int board_num;
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getReply_ref() {
		return reply_ref;
	}
	public void setReply_ref(int reply_ref) {
		this.reply_ref = reply_ref;
	}
	public int getReply_level() {
		return reply_level;
	}
	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}
	public int getReply_step() {
		return reply_step;
	}
	public void setReply_step(int reply_step) {
		this.reply_step = reply_step;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
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
	public ReplyVo(int reply_num, int reply_ref, int reply_level, int reply_step, String reply_content, Date reply_date,
			int member_num, int board_num) {
		super();
		this.reply_num = reply_num;
		this.reply_ref = reply_ref;
		this.reply_level = reply_level;
		this.reply_step = reply_step;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.member_num = member_num;
		this.board_num = board_num;
	}
	public ReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
