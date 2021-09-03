package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVo;

@Repository
public class MemberDao {

	// 회원가입, 로그인
	public int insert(MemberVo m) {
		return DBManager.insertMember(m);
	}
	
	public MemberVo loginMember(String username) {
		return DBManager.loginMember(username);
	}
	
	// 마이페이지
	public MemberVo getMember(int member_num) {
		return DBManager.getMember(member_num);
	}

}