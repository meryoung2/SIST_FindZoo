package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BoardVo;

@Repository
public class BoardDao {
	
	public List<BoardVo> findAll(){
		return DBManager.listBoard();
	}
}