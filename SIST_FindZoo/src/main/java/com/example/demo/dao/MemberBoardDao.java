package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberBoardVo;

@Repository
public class MemberBoardDao {
	public List<MemberBoardVo> findAll(HashMap map){
		return DBManager.memberBoard(map);
	}
	
	public int getTotalRecordMemberBoard(int member_num) {
		return DBManager.getTotalRecordMemberBoard(member_num);
	}
}
