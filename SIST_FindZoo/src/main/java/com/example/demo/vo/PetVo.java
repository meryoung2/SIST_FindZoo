package com.example.demo.vo;

import java.util.Date;

public class PetVo {

	private int pet_num;
	private String pet_name;
	private String pet_sex;
	private String pet_type;
	private String pet_regist_num;
	private Date pet_birth;
	private int member_num;
	
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
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_regist_num() {
		return pet_regist_num;
	}
	public void setPet_regist_num(String pet_regist_num) {
		this.pet_regist_num = pet_regist_num;
	}
	public Date getPet_birth() {
		return pet_birth;
	}
	public void setPet_birth(Date pet_birth) {
		this.pet_birth = pet_birth;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public PetVo(int pet_num, String pet_name, String pet_sex, String pet_type, String pet_regist_num, Date pet_birth,
			int member_num) {
		super();
		this.pet_num = pet_num;
		this.pet_name = pet_name;
		this.pet_sex = pet_sex;
		this.pet_type = pet_type;
		this.pet_regist_num = pet_regist_num;
		this.pet_birth = pet_birth;
		this.member_num = member_num;
	}
	
	public PetVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}