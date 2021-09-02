package com.example.demo.vo;

import java.util.Date;

public class FindVo {
	private int find_num;
	private int find_reward;
	private String find_pet;
	private String find_lost_loc;
	private Date find_lost_date;
	private int board_num;
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
	public FindVo(int find_num, int find_reward, String find_pet, String find_lost_loc, Date find_lost_date,
			int board_num) {
		super();
		this.find_num = find_num;
		this.find_reward = find_reward;
		this.find_pet = find_pet;
		this.find_lost_loc = find_lost_loc;
		this.find_lost_date = find_lost_date;
		this.board_num = board_num;
	}
	public FindVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
