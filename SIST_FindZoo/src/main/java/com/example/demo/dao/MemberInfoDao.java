package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MyPostVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.PetVo;

@Repository
public class MemberInfoDao {
	public List<MyPostVo> findAll(HashMap map){
		return DBManager.myPost(map);
	}
	
	public int getTotalRecordMyPost(int member_num) {
		return DBManager.getTotalRecordMyPost(member_num);
	}
	
	public MemberVo getMember(int member_num) {
		return DBManager.getMember(member_num);
	}
	
	public List<PetVo> listPet(int member_num) {
		return DBManager.listPet(member_num);
	}
}
