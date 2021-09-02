package com.example.demo.dao;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVo;

public class MemberDao {

	public MemberVo getMember(int member_num) {
		return DBManager.getMember(member_num);
	}
	
}