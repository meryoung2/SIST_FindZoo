package com.example.demo.vo;

public class MemberVo {
	private int member_num;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_nick;
	private String member_phone;
	private String member_email;
	private String member_addr;
	private int member_point;
	private String member_sms;
	private String member_admin;
	private int social_num;
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
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
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getMember_sms() {
		return member_sms;
	}
	public void setMember_sms(String member_sms) {
		this.member_sms = member_sms;
	}
	public String getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(String member_admin) {
		this.member_admin = member_admin;
	}
	public int getSocial_num() {
		return social_num;
	}
	public void setSocial_num(int social_num) {
		this.social_num = social_num;
	}
	
	public MemberVo(int member_num, String member_id, String member_pwd, String member_name, String member_nick,
			String member_phone, String member_email, String member_addr, int member_point, String member_sms,
			String member_admin, int social_num) {
		super();
		this.member_num = member_num;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_nick = member_nick;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_addr = member_addr;
		this.member_point = member_point;
		this.member_sms = member_sms;
		this.member_admin = member_admin;
		this.social_num = social_num;
	}
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

}