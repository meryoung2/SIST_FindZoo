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
	
	public List<String> findAllPicture(HashMap map_pic){
		return DBManager.findPicture(map_pic);
	}
	
	public List<FindVo> searchFind(HashMap map){
		return DBManager.searchFind(map);
	}
	
	public List<String> searchFindPicture(HashMap map_pic){
		return DBManager.searchFindPicture(map_pic);
	}
	
	public int insertFind(FindVo f) {
		return DBManager.insertFind(f);
	}
	
	public FindVo getFind(int find_num) {
		return DBManager.getFind(find_num);
	}
	
	public List<String> getFindPicture(int find_num) {
		return DBManager.getFindPicture(find_num);
	}
	
	public void updateViewsFind(int board_num) {
		DBManager.updateViewsFind(board_num);
	}
	
	public int getTotalRecordFind() {
		return DBManager.getTotalRecordFind();
	}
	
	public int getSearchRecordFind(HashMap num_map) {
		return DBManager.getSearchRecordFind(num_map);
	}
	
	public int updateFind(FindVo f) {
		return DBManager.updateFind(f);
	}

	public int deleteFind(int board_num) {
		return DBManager.deleteFind(board_num);
	}
}