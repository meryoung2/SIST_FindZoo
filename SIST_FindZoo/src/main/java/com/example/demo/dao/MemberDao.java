package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVo;

@Repository
public class MemberDao {

	public MemberVo getMember(int member_num) {
		return DBManager.getMember(member_num);
	}
	
}