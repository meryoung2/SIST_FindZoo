package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MyPostVo;

@Repository
public class MyPostDao {
	// 특정 회원이 작성한 목록 출력
	public List<MyPostVo> findAll(HashMap map){
		return DBManager.myPost(map);
	}
	
	// 특정 회원이 작성한 전체 글 갯수
	public int getTotalRecordMyPost(int member_num) {
		return DBManager.getTotalRecordMyPost(member_num);
	}
}