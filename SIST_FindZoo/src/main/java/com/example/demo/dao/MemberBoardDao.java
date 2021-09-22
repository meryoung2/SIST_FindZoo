package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberBoardVo;

@Repository
public class MemberBoardDao {
	// 특정 회원의 닉네임 출력
	public String getNick(int member_num) {
		return DBManager.getNick(member_num);
	}
	
	// 특정 회원이 작성한 목록 출력
	public List<MemberBoardVo> findAll(HashMap map){
		return DBManager.memberBoard(map);
	}
	
	// 특정 회원이 작성한 전체 글 갯수
	public int getTotalRecordMemberBoard(int member_num) {
		return DBManager.getTotalRecordMemberBoard(member_num);
	}
}