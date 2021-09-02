package com.example.demo.vo;

import java.util.Date;

public class QnaVo {

	private int qna_num;
	private String qna_q_title;
	private String qna_q_content;
	private String qna_a_content;
	private Date qna_q_date;
	private Date qna_a_date;
	private int user_num;
	private int admin_num;
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_q_title() {
		return qna_q_title;
	}
	public void setQna_q_title(String qna_q_title) {
		this.qna_q_title = qna_q_title;
	}
	public String getQna_q_content() {
		return qna_q_content;
	}
	public void setQna_q_content(String qna_q_content) {
		this.qna_q_content = qna_q_content;
	}
	public String getQna_a_content() {
		return qna_a_content;
	}
	public void setQna_a_content(String qna_a_content) {
		this.qna_a_content = qna_a_content;
	}
	public Date getQna_q_date() {
		return qna_q_date;
	}
	public void setQna_q_date(Date qna_q_date) {
		this.qna_q_date = qna_q_date;
	}
	public Date getQna_a_date() {
		return qna_a_date;
	}
	public void setQna_a_date(Date qna_a_date) {
		this.qna_a_date = qna_a_date;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	
	public QnaVo(int qna_num, String qna_q_title, String qna_q_content, String qna_a_content, Date qna_q_date,
			Date qna_a_date, int user_num, int admin_num) {
		super();
		this.qna_num = qna_num;
		this.qna_q_title = qna_q_title;
		this.qna_q_content = qna_q_content;
		this.qna_a_content = qna_a_content;
		this.qna_q_date = qna_q_date;
		this.qna_a_date = qna_a_date;
		this.user_num = user_num;
		this.admin_num = admin_num;
	}
	
	public QnaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}