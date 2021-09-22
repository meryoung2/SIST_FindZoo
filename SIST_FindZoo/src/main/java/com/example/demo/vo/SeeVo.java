package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class SeeVo {
	private int see_num;
	private String see_pet;
	private String see_find_loc;
	private String see_find_date;
	private int board_num;
	private String title;
	private String content;
	private Date bdate;
	private int views;
	private int board_type_num;
	private int member_num;
	private String member_name;
	private String member_nick;
	private MultipartFile picture_file;
	private String picture_fname;
	public int getSee_num() {
		return see_num;
	}
	public void setSee_num(int see_num) {
		this.see_num = see_num;
	}
	public String getSee_pet() {
		return see_pet;
	}
	public void setSee_pet(String see_pet) {
		this.see_pet = see_pet;
	}
	public String getSee_find_loc() {
		return see_find_loc;
	}
	public void setSee_find_loc(String see_find_loc) {
		this.see_find_loc = see_find_loc;
	}
	public String getSee_find_date() {
		return see_find_date;
	}
	public void setSee_find_date(String see_find_date) {
		this.see_find_date = see_find_date;
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
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public MultipartFile getPicture_file() {
		return picture_file;
	}
	public void setPicture_file(MultipartFile picture_file) {
		this.picture_file = picture_file;
	}
	public String getPicture_fname() {
		return picture_fname;
	}
	public void setPicture_fname(String picture_fname) {
		this.picture_fname = picture_fname;
	}
	public SeeVo(int see_num, String see_pet, String see_find_loc, String see_find_date, int board_num, String title,
			String content, Date bdate, int views, int board_type_num, int member_num, String member_name,
			String member_nick, MultipartFile picture_file, String picture_fname) {
		super();
		this.see_num = see_num;
		this.see_pet = see_pet;
		this.see_find_loc = see_find_loc;
		this.see_find_date = see_find_date;
		this.board_num = board_num;
		this.title = title;
		this.content = content;
		this.bdate = bdate;
		this.views = views;
		this.board_type_num = board_type_num;
		this.member_num = member_num;
		this.member_name = member_name;
		this.member_nick = member_nick;
		this.picture_file = picture_file;
		this.picture_fname = picture_fname;
	}
	public SeeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SeeVo [see_num=" + see_num + ", see_pet=" + see_pet + ", see_find_loc=" + see_find_loc
				+ ", see_find_date=" + see_find_date + ", board_num=" + board_num + ", title=" + title + ", content="
				+ content + ", bdate=" + bdate + ", views=" + views + ", board_type_num=" + board_type_num
				+ ", member_num=" + member_num + ", member_name=" + member_name + ", member_nick=" + member_nick
				+ ", picture_file=" + picture_file + ", picture_fname=" + picture_fname + "]";
	}
	
	
	
	
}
