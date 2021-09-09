package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.FindVo;
import com.example.demo.vo.ReplyVo;

@Repository
public class FindDao {
	
	public List<FindVo> findAll(HashMap map){
		return DBManager.find(map);
	}
	
	public List<FindVo> searchFind(HashMap map){
		return DBManager.searchFind(map);
	}
	
	public int insertFind(FindVo f) {
		return DBManager.insertFind(f);
	}
	
	public FindVo getFind(int find_num) {
		return DBManager.getFind(find_num);
	}
	
	public void updateViewsFind(int board_num) {
		DBManager.updateViewsFind(board_num);
	}
	
	public int getTotalRecordFind() {
		return DBManager.getTotalRecordFind();
	}
	
	public int updateFind(FindVo f) {
		return DBManager.updateFind(f);
	}

	public int deleteFind(int board_num) {
		return DBManager.deleteFind(board_num);
	}
	
	public List<ReplyVo> findAll(int board_num){
		return DBManager.listReply(board_num);
	}
	
	public ReplyVo getReply(int reply_num) {
		return DBManager.getReply(reply_num);
	}
	
	public int insertReply(ReplyVo r) {
		return DBManager.insertReply(r);
	}
	
	public int getNextReply_num() {
		return DBManager.getNextReply_num();
	}

	public void updateStep(int reply_ref, int reply_step) {
		// TODO Auto-generated method stub
		DBManager.updateStep(reply_ref,reply_step);
	}
	
	public int update(ReplyVo r) {
		return DBManager.updateReply(r);
	}
	
	public int delelte(int reply_num) {
		return DBManager.deleteReply(reply_num);
	}

}