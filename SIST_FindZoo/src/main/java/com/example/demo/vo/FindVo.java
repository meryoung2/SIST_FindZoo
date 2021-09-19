package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


public class FindVo {
	private int find_num;
	private String find_reward;
	private String find_pet;
	private String find_lost_loc;
	private String find_lost_date;
	private int board_num;
	private String title;
	private String content;
	private Date bdate;
	private int views;
	private int board_type_num;
	private int member_num;
	private String member_name;
	private String member_nick;
	private MultipartFile picture_file1;
	private MultipartFile picture_file2;
	private MultipartFile picture_file3;
	private String picture_file_num1;
	private String picture_file_num2;
	private String picture_file_num3;
	private String picture_fname1;
	private String picture_fname2;
	private String picture_fname3;
	
	public FindVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FindVo(int find_num, String find_reward, String find_pet, String find_lost_loc, String find_lost_date,
			int board_num, String title, String content, Date bdate, int views, int board_type_num, int member_num,
			String member_name, String member_nick, MultipartFile picture_file1, MultipartFile picture_file2,
			MultipartFile picture_file3, String picture_file_num1, String picture_file_num2, String picture_file_num3,
			String picture_fname1, String picture_fname2, String picture_fname3) {
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
		this.member_nick = member_nick;
		this.picture_file1 = picture_file1;
		this.picture_file2 = picture_file2;
		this.picture_file3 = picture_file3;
		this.picture_file_num1 = picture_file_num1;
		this.picture_file_num2 = picture_file_num2;
		this.picture_file_num3 = picture_file_num3;
		this.picture_fname1 = picture_fname1;
		this.picture_fname2 = picture_fname2;
		this.picture_fname3 = picture_fname3;
	}
	public int getFind_num() {
		return find_num;
	}
	public void setFind_num(int find_num) {
		this.find_num = find_num;
	}
	public String getFind_reward() {
		return find_reward;
	}
	public void setFind_reward(String find_reward) {
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
	public String getFind_lost_date() {
		return find_lost_date;
	}
	public void setFind_lost_date(String find_lost_date) {
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
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public MultipartFile getPicture_file1() {
		return picture_file1;
	}
	public void setPicture_file1(MultipartFile picture_file1) {
		this.picture_file1 = picture_file1;
	}
	public MultipartFile getPicture_file2() {
		return picture_file2;
	}
	public void setPicture_file2(MultipartFile picture_file2) {
		this.picture_file2 = picture_file2;
	}
	public MultipartFile getPicture_file3() {
		return picture_file3;
	}
	public void setPicture_file3(MultipartFile picture_file3) {
		this.picture_file3 = picture_file3;
	}
	public String getPicture_file_num1() {
		return picture_file_num1;
	}
	public void setPicture_file_num1(String picture_file_num1) {
		this.picture_file_num1 = picture_file_num1;
	}
	public String getPicture_file_num2() {
		return picture_file_num2;
	}
	public void setPicture_file_num2(String picture_file_num2) {
		this.picture_file_num2 = picture_file_num2;
	}
	public String getPicture_file_num3() {
		return picture_file_num3;
	}
	public void setPicture_file_num3(String picture_file_num3) {
		this.picture_file_num3 = picture_file_num3;
	}
	public String getPicture_fname1() {
		return picture_fname1;
	}
	public void setPicture_fname1(String picture_fname1) {
		this.picture_fname1 = picture_fname1;
	}
	public String getPicture_fname2() {
		return picture_fname2;
	}
	public void setPicture_fname2(String picture_fname2) {
		this.picture_fname2 = picture_fname2;
	}
	public String getPicture_fname3() {
		return picture_fname3;
	}
	public void setPicture_fname3(String picture_fname3) {
		this.picture_fname3 = picture_fname3;
	}	
}