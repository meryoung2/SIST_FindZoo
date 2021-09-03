package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.DealVo;

@Repository
public class DealDao {
	
	public List<DealVo> findAll(){
		return DBManager.listDeal();
	}
	
	public int insertDeal(DealVo d) {
		return DBManager.insertDeal(d);
	}
	
	public DealVo getDeal(int deal_num) {
		return DBManager.getDeal(deal_num);
	}
	
	public void updateHit(int board_num) {
		DBManager.updateDealHit(board_num);
	}
}
