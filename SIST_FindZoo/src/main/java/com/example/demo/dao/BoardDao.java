package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BoardVo;

@Repository
public class BoardDao {
	
	public static int pageSize = 10;
	public static int totalRecord;
	public static int totalPage;
	
	public List<BoardVo> findAll(HashMap map){
		return DBManager.listBoard(map);
	}
	
	public BoardVo getBoard(int board_num) {
		return DBManager.getBoard(board_num);
	}
	
	public void updateViews(int board_num) {
		DBManager.updateViews(board_num);
	}

	public int getTotalRecord() {
		return DBManager.getTotalRecord();
	}

	public int insert(BoardVo b) {
		return DBManager.insertBoard(b);
	}
	
	public int delete(int board_num) {
		return DBManager.deleteBoard(board_num);
	}
}