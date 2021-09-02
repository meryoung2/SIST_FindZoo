package com.example.demo.vo;

import java.util.Date;

public class SeeVo {
	private int see_num;
	private String see_pet;
	private String see_find_loc;
	private Date see_find_date;
	private int board_num;
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
	public Date getSee_find_date() {
		return see_find_date;
	}
	public void setSee_find_date(Date see_find_date) {
		this.see_find_date = see_find_date;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public SeeVo(int see_num, String see_pet, String see_find_loc, Date see_find_date, int board_num) {
		super();
		this.see_num = see_num;
		this.see_pet = see_pet;
		this.see_find_loc = see_find_loc;
		this.see_find_date = see_find_date;
		this.board_num = board_num;
	}
	public SeeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
