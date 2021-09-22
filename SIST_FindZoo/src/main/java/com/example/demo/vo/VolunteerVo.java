package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class VolunteerVo {
	private int volunteer_num;
	private String volunteer_cname;
	private String volunteer_loc;
	private String volunteer_tel;
	private String volunteer_s_date;
	private String volunteer_e_date;
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
	public int getVolunteer_num() {
		return volunteer_num;
	}
	public void setVolunteer_num(int volunteer_num) {
		this.volunteer_num = volunteer_num;
	}
	public String getVolunteer_cname() {
		return volunteer_cname;
	}
	public void setVolunteer_cname(String volunteer_cname) {
		this.volunteer_cname = volunteer_cname;
	}
	public String getVolunteer_loc() {
		return volunteer_loc;
	}
	public void setVolunteer_loc(String volunteer_loc) {
		this.volunteer_loc = volunteer_loc;
	}
	public String getVolunteer_tel() {
		return volunteer_tel;
	}
	public void setVolunteer_tel(String volunteer_tel) {
		this.volunteer_tel = volunteer_tel;
	}
	public String getVolunteer_s_date() {
		return volunteer_s_date;
	}
	public void setVolunteer_s_date(String volunteer_s_date) {
		this.volunteer_s_date = volunteer_s_date;
	}
	public String getVolunteer_e_date() {
		return volunteer_e_date;
	}
	public void setVolunteer_e_date(String volunteer_e_date) {
		this.volunteer_e_date = volunteer_e_date;
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
	public VolunteerVo(int volunteer_num, String volunteer_cname, String volunteer_loc, String volunteer_tel,
			String volunteer_s_date, String volunteer_e_date, int board_num, String title, String content, Date bdate,
			int views, int board_type_num, int member_num, String member_name, String member_nick,
			MultipartFile picture_file, String picture_fname) {
		super();
		this.volunteer_num = volunteer_num;
		this.volunteer_cname = volunteer_cname;
		this.volunteer_loc = volunteer_loc;
		this.volunteer_tel = volunteer_tel;
		this.volunteer_s_date = volunteer_s_date;
		this.volunteer_e_date = volunteer_e_date;
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
	public VolunteerVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "VolunteerVo [volunteer_num=" + volunteer_num + ", volunteer_cname=" + volunteer_cname
				+ ", volunteer_loc=" + volunteer_loc + ", volunteer_tel=" + volunteer_tel + ", volunteer_s_date="
				+ volunteer_s_date + ", volunteer_e_date=" + volunteer_e_date + ", board_num=" + board_num + ", title="
				+ title + ", content=" + content + ", bdate=" + bdate + ", views=" + views + ", board_type_num="
				+ board_type_num + ", member_num=" + member_num + ", member_name=" + member_name + ", member_nick="
				+ member_nick + ", picture_file=" + picture_file + ", picture_fname=" + picture_fname + "]";
	}
	
	
}
