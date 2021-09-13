package com.example.demo.dao;

import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.ReplyVo;

@Repository
public class DealDao {
	
	public List<DealVo> findAll(HashMap map){
		return DBManager.deal(map);
	}
	
	public List<DealVo> searchDeal(HashMap map){
		return DBManager.searchDeal(map);
	}
	
	public int insertDeal(DealVo d) {
		return DBManager.insertDeal(d);
	}
	
	public DealVo getDeal(int deal_num) {
		return DBManager.getDeal(deal_num);
	}
	
	public void updateViewsDeal(int board_num) {
		DBManager.updateViewsDeal(board_num);
	}
	
	public int getTotalRecordDeal() {
		return DBManager.getTotalRecordDeal();
	}
	
	public int getSearchRecordDeal(HashMap num_map) {
		return DBManager.getSearchRecordDeal(num_map);
	}
	
	public int updateDeal(DealVo d) {
		return DBManager.updateDeal(d);
	}

	public int deleteDeal(int board_num) {
		return DBManager.deleteDeal(board_num);
	}
	
	public List<ReplyVo> findAll(int board_num){
		return DBManager.listReply(board_num);
	}
	
	public int insertReply(ReplyVo r) {
		return DBManager.insertReply(r);
	}
	
	
	public int updateReply(ReplyVo r) {
		return DBManager.updateReply(r);
	}
	
	public int deleteReply(int reply_num) {
		return DBManager.deleteReply(reply_num);
	}
	
	public int insertReReply(ReplyVo r) {
		return DBManager.insertReReply(r);
	}
}