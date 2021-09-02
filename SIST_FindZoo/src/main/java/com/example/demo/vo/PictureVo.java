package com.example.demo.vo;

public class PictureVo {
	private int picture_file_num;
	private String picture_fname;
	private  int board_num;
	public int getPicture_file_num() {
		return picture_file_num;
	}
	public void setPicture_file_num(int picture_file_num) {
		this.picture_file_num = picture_file_num;
	}
	public String getPicture_fname() {
		return picture_fname;
	}
	public void setPicture_fname(String picture_fname) {
		this.picture_fname = picture_fname;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public PictureVo(int picture_file_num, String picture_fname, int board_num) {
		super();
		this.picture_file_num = picture_file_num;
		this.picture_fname = picture_fname;
		this.board_num = board_num;
	}
	public PictureVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
