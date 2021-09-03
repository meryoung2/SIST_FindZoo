package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVo;

@Repository
public class MemberDao {
	
	// 마이페이지
	public MemberVo getMember(int member_num) {
		return DBManager.getMember(member_num);
	}

}