package com.example.demo.vo;

import java.util.Date;

public class PointVo {

	private int point_num;
	private String point_name;
	private int point_get;
	private Date point_time;
	private int member_num;
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getPoint_name() {
		return point_name;
	}
	public void setPoint_name(String point_name) {
		this.point_name = point_name;
	}
	public int getPoint_get() {
		return point_get;
	}
	public void setPoint_get(int point_get) {
		this.point_get = point_get;
	}
	public Date getPoint_time() {
		return point_time;
	}
	public void setPoint_time(Date point_time) {
		this.point_time = point_time;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public PointVo(int point_num, String point_name, int point_get, Date point_time, int member_num) {
		super();
		this.point_num = point_num;
		this.point_name = point_name;
		this.point_get = point_get;
		this.point_time = point_time;
		this.member_num = member_num;
	}
	
	public PointVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}