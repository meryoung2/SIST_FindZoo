package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BohoVo;
import com.example.demo.vo.FindVo;

@Repository
public class MainDao {

	public List<FindVo> mainFind(){
		return DBManager.mainFind();
	}
	
	public List<BohoVo> mainBoho(){
		return DBManager.mainBoho();
	}
}
