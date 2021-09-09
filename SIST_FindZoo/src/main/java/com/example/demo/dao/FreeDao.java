package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.FreeVo;

@Repository
public class FreeDao {
	
	public List<FreeVo> findAll(HashMap map){
		return DBManager.free(map);
	}
	
	public List<FreeVo> searchFree(HashMap map){
		return DBManager.searchFree(map);
	}
	
	public FreeVo getFree(int board_num) {
		return DBManager.getFree(board_num);
	}
	
	public void updateViews(int board_num) {
		DBManager.updateViews(board_num);
	}

	public int getTotalRecordFree() {
		return DBManager.getTotalRecordFree();
	}
	
	public int getSearchRecordFree(HashMap num_map) {
		return DBManager.getSearchRecordFree(num_map);
	}

	public int insert(FreeVo f) {
		return DBManager.insertFree(f);
	}
	
	public int update(FreeVo f) {
		return DBManager.updateFree(f);
	}
	
	public int delete(int board_num) {
		return DBManager.deleteFree(board_num);
	}
}