package com.example.demo.dao;

import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.FreeVo;
import com.example.demo.vo.ReplyVo;

@Repository
public class InformationDao {
	
	public List<FreeVo> findAll(HashMap map){
		return DBManager.information(map);
	}
	
	public List<FreeVo> searchInformation(HashMap map){
		return DBManager.searchInformation(map);
	}
	
	public FreeVo getInformation(int board_num) {
		return DBManager.getInformation(board_num);
	}
	
	public void updateViewsInformation(int board_num) {
		DBManager.updateViewsInformation(board_num);
	}

	public int getTotalRecordInformation() {
		return DBManager.getTotalRecordInformation();
	}
	
	public int getSearchRecordInformation(HashMap num_map) {
		return DBManager.getSearchRecordInformation(num_map);
	}

	public int insert(FreeVo f) {
		return DBManager.insertInformation(f);
	}
	
	public int update(FreeVo f) {
		return DBManager.updateInformation(f);
	}
	
	public int delete(int board_num) {
		return DBManager.deleteInformation(board_num);
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