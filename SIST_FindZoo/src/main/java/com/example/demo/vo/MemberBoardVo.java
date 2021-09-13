package com.example.demo.vo;

import java.util.Date;

public class MemberBoardVo {
	private int board_num;
	private String title;
	private String content;
	private Date bdate;
	private int views;
	private int board_type_num;
	private int member_num;
	private String member_nick;
	
	public MemberBoardVo() {
		super();
	}
	
	public MemberBoardVo(int board_num, String title, String content, Date bdate, int views, int board_type_num,
			int member_num, String member_nick) {
		super();
		this.board_num = board_num;
		this.title = title;
		this.content = content;
		this.bdate = bdate;
		this.views = views;
		this.board_type_num = board_type_num;
		this.member_num = member_num;
		this.member_nick = member_nick;
	}
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getBoard_type_num() {
		return board_type_num;
	}
	public void setBoard_type_num(int board_type_num) {
		this.board_type_num = board_type_num;
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
}
