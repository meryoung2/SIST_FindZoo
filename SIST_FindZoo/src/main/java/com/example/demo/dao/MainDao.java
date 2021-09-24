package com.example.demo.dao;

import java.util.HashMap;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BohoVo;
import com.example.demo.vo.FindVo;

@Repository
public class MainDao {

	
	public List<FindVo> mainFind(HashMap map){
		return DBManager.mainFind(map);
	}
	
	public List<String> mainFindPicture(HashMap map_pic){
		return DBManager.mainFindPicture(map_pic);
	}
	
	public List<BohoVo> mainBoho(HashMap map){
		return DBManager.mainBoho(map);
	}
	
	public List<String> mainBohoPicture(HashMap map_pic){
		return DBManager.mainBohoPicture(map_pic);
	}
}
