package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MyReplyVo;

@Repository
public class MyReplyDao {
	// 특정 회원이 작성한 목록 출력
	public List<MyReplyVo> findAll(HashMap map){
		return DBManager.myReply(map);
	}
	
	// 특정 회원이 작성한 전체 글 갯수
	public int getTotalRecordMyReply(int member_num) {
		return DBManager.getTotalRecordMyReply(member_num);
	}
}