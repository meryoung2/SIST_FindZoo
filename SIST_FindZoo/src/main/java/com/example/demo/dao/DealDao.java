package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.DealVo;

@Repository
public class DealDao {
	
	public static int pageSize = 10;
	public static int totalRecord;
	public static int totalPage;
	
	
	public List<DealVo> findAll(HashMap map){
		return DBManager.listDeal(map);
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
	
	public int getTotalRecordDeal() {
		return DBManager.getTotalRecordDeal();
	}

}
