package com.example.demo.vo;

import java.util.Date;

public class VolunteerVo {
	private int volunteer_num;
	private String volunteer_cname;
	private String volunteer_loc;
	private String volunteer_tel;
	private Date volunteer_s_date;
	private Date volunteer_e_date;
	private int board_num;
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
	public Date getVolunteer_s_date() {
		return volunteer_s_date;
	}
	public void setVolunteer_s_date(Date volunteer_s_date) {
		this.volunteer_s_date = volunteer_s_date;
	}
	public Date getVolunteer_e_date() {
		return volunteer_e_date;
	}
	public void setVolunteer_e_date(Date volunteer_e_date) {
		this.volunteer_e_date = volunteer_e_date;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public VolunteerVo(int volunteer_num, String volunteer_cname, String volunteer_loc, String volunteer_tel,
			Date volunteer_s_date, Date volunteer_e_date, int board_num) {
		super();
		this.volunteer_num = volunteer_num;
		this.volunteer_cname = volunteer_cname;
		this.volunteer_loc = volunteer_loc;
		this.volunteer_tel = volunteer_tel;
		this.volunteer_s_date = volunteer_s_date;
		this.volunteer_e_date = volunteer_e_date;
		this.board_num = board_num;
	}
	public VolunteerVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
