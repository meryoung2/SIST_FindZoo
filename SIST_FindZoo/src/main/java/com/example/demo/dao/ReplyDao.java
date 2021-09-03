package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ReplyVo;

@Repository
public class ReplyDao {
	
	public List<ReplyVo> findAll(){
		return DBManager.listReply();
	}
	
	public int insert(ReplyVo r) {
		return DBManager.insertReply(r);
	}
}
