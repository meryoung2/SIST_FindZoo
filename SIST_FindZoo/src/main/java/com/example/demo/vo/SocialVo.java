package com.example.demo.vo;

public class SocialVo {
	private int social_num;
	private String social_name;
	
	public int getSocial_num() {
		return social_num;
	}
	public void setSocial_num(int social_num) {
		this.social_num = social_num;
	}
	public String getSocial_name() {
		return social_name;
	}
	public void setSocial_name(String social_name) {
		this.social_name = social_name;
	}
	public SocialVo(int social_num, String social_name) {
		super();
		this.social_num = social_num;
		this.social_name = social_name;
	}
	public SocialVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
