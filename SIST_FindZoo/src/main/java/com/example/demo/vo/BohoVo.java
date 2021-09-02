package com.example.demo.vo;

import java.util.Date;

public class BohoVo {
	private int boho_num;
	private String boho_pet;
	private String boho_find_loc;
	private Date boho_find_date;
	private int board_num;
	
	public BohoVo() {
		super();
	}
	
	public BohoVo(int boho_num, String boho_pet, String boho_find_loc, Date boho_find_date, int board_num) {
		super();
		this.boho_num = boho_num;
		this.boho_pet = boho_pet;
		this.boho_find_loc = boho_find_loc;
		this.boho_find_date = boho_find_date;
		this.board_num = board_num;
	}
	
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
}
