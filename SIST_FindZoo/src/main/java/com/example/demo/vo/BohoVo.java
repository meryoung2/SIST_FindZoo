package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BohoVo {
	private int boho_num;
	private String boho_pet;
	private String boho_find_loc;
	private Date boho_find_date;
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
	private String member_phone;
	private int pet_num;
	private String pet_name;
	private String pet_sex;
	
	public int getBoho_num() {
		return boho_num;
	}
	public void setBoho_num(int boho_num) {
		this.boho_num = boho_num;
	}
	public String getBoho_pet() {
		return boho_pet;
	}
	public void setBoho_pet(String boho_pet) {
		this.boho_pet = boho_pet;
	}
	public String getBoho_find_loc() {
		return boho_find_loc;
	}
	public void setBoho_find_loc(String boho_find_loc) {
		this.boho_find_loc = boho_find_loc;
	}
	public Date getBoho_find_date() {
		return boho_find_date;
	}
	public void setBoho_find_date(Date boho_find_date) {
		this.boho_find_date = boho_find_date;
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
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getPet_num() {
		return pet_num;
	}
	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_sex() {
		return pet_sex;
	}
	public void setPet_sex(String pet_sex) {
		this.pet_sex = pet_sex;
	}
	public BohoVo(int boho_num, String boho_pet, String boho_find_loc, Date boho_find_date, int board_num, String title,
			String content, Date bdate, int views, int board_type_num, int member_num, String member_name,
			MultipartFile picture_file, String picture_fname, String member_phone, int pet_num, String pet_name,
			String pet_sex) {
		super();
		this.boho_num = boho_num;
		this.boho_pet = boho_pet;
		this.boho_find_loc = boho_find_loc;
		this.boho_find_date = boho_find_date;
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
		this.member_phone = member_phone;
		this.pet_num = pet_num;
		this.pet_name = pet_name;
		this.pet_sex = pet_sex;
	}
	public BohoVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
