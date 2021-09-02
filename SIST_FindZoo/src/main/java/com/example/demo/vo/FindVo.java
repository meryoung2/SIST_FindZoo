package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FindVo {
	private int find_num;
	private int find_reward;
	private String find_pet;
	private String find_lost_loc;
	private Date find_lost_date;
	private int board_num;
	private String title;
	private String content;
	private Date bdate;
	private int views;
	private int board_type_num;
	private int member_num;
	private String member_name;
	private MultipartFile picture_file;
	private String picture_fname;
	public int getFind_num() {
		return find_num;
	}
	public void setFind_num(int find_num) {
		this.find_num = find_num;
	}
	public int getFind_reward() {
		return find_reward;
	}
	public void setFind_reward(int find_reward) {
		this.find_reward = find_reward;
	}
	public String getFind_pet() {
		return find_pet;
	}
	public void setFind_pet(String find_pet) {
		this.find_pet = find_pet;
	}
	public String getFind_lost_loc() {
		return find_lost_loc;
	}
	public void setFind_lost_loc(String find_lost_loc) {
		this.find_lost_loc = find_lost_loc;
	}
	public Date getFind_lost_date() {
		return find_lost_date;
	}
	public void setFind_lost_date(Date find_lost_date) {
		this.find_lost_date = find_lost_date;
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
	public FindVo(int find_num, int find_reward, String find_pet, String find_lost_loc, Date find_lost_date,
			int board_num, String title, String content, Date bdate, int views, int board_type_num, int member_num,
			String member_name, MultipartFile picture_file, String picture_fname) {
		super();
		this.find_num = find_num;
		this.find_reward = find_reward;
		this.find_pet = find_pet;
		this.find_lost_loc = find_lost_loc;
		this.find_lost_date = find_lost_date;
		this.board_num = board_num;
		this.title = title;
		this.content = content;
		this.bdate = bdate;
		this.views = views;
		this.board_type_num = board_type_num;
		this.member_num = member_num;
		this.member_name = member_name;
		this.picture_file = picture_file;
		this.picture_fname = picture_fname;
	}
	public FindVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
