package com.example.demo.dao;

import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.SeeVo;
import com.example.demo.vo.VolunteerVo;

@Repository
public class VolunteerDao {
	
	public List<VolunteerVo> findAll(HashMap map){
		return DBManager.vol(map);
	}
	
	public List<VolunteerVo> searchVol(HashMap map){
		return DBManager.searchVol(map);
	}
	
	public int insertVol(VolunteerVo v) {
		return DBManager.insertVol(v);
	}
	
	public VolunteerVo getvol(int volunteer_num) {
		return DBManager.getVol(volunteer_num);
	}
	
	public void updateViewsVol(int board_num) {
		DBManager.updateViewsVol(board_num);
	}
	
	public int getTotalRecordVol() {
		return DBManager.getTotalRecordVol();
	}
	
	public int getSearchRecordVol(HashMap num_map) {
		return DBManager.getSearchRecordVol(num_map);
	}
	
	public int updateVol(VolunteerVo v) {
		return DBManager.updateVol(v);
	}

	public int deleteVol(int board_num) {
		return DBManager.deleteVol(board_num);
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