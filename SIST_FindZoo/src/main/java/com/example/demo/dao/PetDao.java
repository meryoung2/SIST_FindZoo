package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.PetVo;

@Repository
public class PetDao {

	public PetVo getPet(int member_num) {
		return DBManager.getPet(member_num);
	}
	
}