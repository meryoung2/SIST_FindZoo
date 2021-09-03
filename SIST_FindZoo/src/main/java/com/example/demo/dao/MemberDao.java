package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVo;

@Repository
public class MemberDao {

	public int insert(MemberVo m) {
		return DBManager.insertMember(m);
	}
	
	public MemberVo getMember(String username) {
		return DBManager.getMember(username);
	}
}
