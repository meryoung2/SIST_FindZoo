package com.example.demo.vo;

public class DealVo {
	private int deal_num;
	private int deal_price;
	private int board_num;
	public int getDeal_num() {
		return deal_num;
	}
	public void setDeal_num(int deal_num) {
		this.deal_num = deal_num;
	}
	public int getDeal_price() {
		return deal_price;
	}
	public void setDeal_price(int deal_price) {
		this.deal_price = deal_price;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public DealVo(int deal_num, int deal_price, int board_num) {
		super();
		this.deal_num = deal_num;
		this.deal_price = deal_price;
		this.board_num = board_num;
	}
	public DealVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
