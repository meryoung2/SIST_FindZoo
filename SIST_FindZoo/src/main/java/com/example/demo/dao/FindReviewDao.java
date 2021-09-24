package com.example.demo.dao;

import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.FreeVo;
import com.example.demo.vo.ReplyVo;

@Repository
public class FindReviewDao {
	
	public List<FreeVo> findAll(HashMap map){
		return DBManager.FindReview(map);
	}
	
	public List<FreeVo> searchFindReview(HashMap map){
		return DBManager.searchFindReview(map);
	}
	
	public FreeVo getFindReview(int board_num) {
		return DBManager.getFindReview(board_num);
	}
	
	public void updateViewsFindReview(int board_num) {
		DBManager.updateViewsFindReview(board_num);
	}

	public int getTotalRecordFindReview() {
		return DBManager.getTotalRecordFindReview();
	}
	
	public int getSearchRecordFindReview(HashMap num_map) {
		return DBManager.getSearchRecordFindReview(num_map);
	}

	public int insert(FreeVo f) {
		return DBManager.insertFindReview(f);
	}
	
	public int update(FreeVo f) {
		return DBManager.updateFindReview(f);
	}
	
	public int delete(int board_num) {
		return DBManager.deleteFindReview(board_num);
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