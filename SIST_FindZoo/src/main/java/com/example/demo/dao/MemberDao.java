package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVo;

@Repository
public class MemberDao {
	
	// 마이페이지 내 정보 조회
	public MemberVo getMember(int member_num) {
		return DBManager.getMember(member_num);
	}

	// 마이페이지 내 정보 수정
	public int updateInfo(MemberVo mb) {
		return DBManager.updateInfo(mb);
	}
	
	// 마이페이지 비밀번호 변경
	public int updatePwd(MemberVo mb) {
		return DBManager.updatePwd(mb);
	}
	
	// 닉네임 중복 확인
	public boolean checkNick(String member_nick) {
		return DBManager.checkNick(member_nick);
	}
		
}