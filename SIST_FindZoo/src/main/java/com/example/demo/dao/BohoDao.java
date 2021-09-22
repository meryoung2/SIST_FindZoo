package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BohoVo;

@Repository
public class BohoDao {
	
	public List<BohoVo> findAll(HashMap map){
		return DBManager.boho(map);
	}
	
	public List<String> findAllPicture(HashMap map_pic){
		return DBManager.bohoPicture(map_pic);
	}
	
	public List<BohoVo> searchBoho(HashMap map){
		return DBManager.searchBoho(map);
	}
	
	public List<String> searchBohoPicture(HashMap map_pic){
		return DBManager.searchBohoPicture(map_pic);
	}
	
	public int insertBoho(BohoVo f) {
		return DBManager.insertBoho(f);
	}
	
	public BohoVo getBoho(int boho_num) {
		return DBManager.getBoho(boho_num);
	}
	
	public List<String> getBohoPicture(int boho_num) {
		return DBManager.getBohoPicture(boho_num);
	}
	
	public void updateViewsBoho(int board_num) {
		DBManager.updateViewsBoho(board_num);
	}
	
	public int getTotalRecordBoho() {
		return DBManager.getTotalRecordBoho();
	}
	
	public int getSearchRecordBoho(HashMap num_map) {
		return DBManager.getSearchRecordBoho(num_map);
	}
	
	public int updateBoho(BohoVo f) {
		return DBManager.updateBoho(f);
	}

	public int deleteBoho(int board_num) {
		return DBManager.deleteBoho(board_num);
	}
}