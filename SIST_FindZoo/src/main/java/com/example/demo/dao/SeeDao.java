package com.example.demo.dao;

import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.SeeVo;

@Repository
public class SeeDao {
	
	public List<SeeVo> findAll(HashMap map){
		return DBManager.see(map);
	}
	
	public List<SeeVo> searchSee(HashMap map){
		return DBManager.searchSee(map);
	}
	
	public int insertSee(SeeVo s) {
		return DBManager.insertSee(s);
	}
	
	public SeeVo getSee(int see_num) {
		return DBManager.getSee(see_num);
	}
	
	public void updateViewsSee(int board_num) {
		DBManager.updateViewsSee(board_num);
	}
	
	public int getTotalRecordSee() {
		return DBManager.getTotalRecordSee();
	}
	
	public int getSearchRecordSee(HashMap num_map) {
		return DBManager.getSearchRecordSee(num_map);
	}
	
	public int updateSee(SeeVo s) {
		return DBManager.updateSee(s);
	}

	public int deleteSee(int board_num) {
		return DBManager.deleteSee(board_num);
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