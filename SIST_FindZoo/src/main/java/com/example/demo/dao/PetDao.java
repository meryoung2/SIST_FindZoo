package com.example.demo.dao;

import com.example.demo.db.DBManager;
import com.example.demo.vo.PetVo;

public class PetDao {

	public PetVo getPet(int member_num) {
		return DBManager.getPet(member_num);
	}
	
}