package com.example.demo.dao;

import java.util.Map;

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
	
	// 회원 탈퇴(해당 회원의 정보나 게시물을 실제로 삭제하지 않고 일부 정보만 수정하여 접근을 제한)
	public int deleteChangeInfo(MemberVo mb) {
		return DBManager.deleteChangeInfo(mb);
	}
	
	//회원가입
	public int insert(MemberVo m) {
		return DBManager.insertMember(m);
	}
	
	//로그인
	public boolean isMember(String member_id, String member_pwd) {
		return DBManager.isMember(member_id, member_pwd);
	}

	//로그인 시, 아이디로 비밀번호 찾기
	public MemberVo loginMember(String member_id) {
		// TODO Auto-generated method stub
		return DBManager.loginMember(member_id);
	}
	
	//아이디 중복체크
	public int idchk(String member_id) {
		return DBManager.idChk(member_id);
	}
	
	//닉네임 중복체크
	public int nickchk(String member_nick) {
		return DBManager.nickChk(member_nick);
	}
	
	//아이디 찾기
	public Map<String, Object> findId(String member_name, String member_phone) {
		System.out.println(member_name);
		return DBManager.findId(member_name, member_phone);
	}
	
	//비밀번호 찾기 시, member_num 카운트 조회 1 or 0
	public int selectPwd(MemberVo m) {
		return DBManager.selectPwd(m);
	}
	
	//비밀번호 찾기 시, 새로운 비밀번호 설정
	public int newPwd(MemberVo mb) {
		return DBManager.newPwd(mb);
	}
		
}