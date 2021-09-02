package com.example.demo.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.BoardVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.PetVo;
import com.example.demo.vo.DealVo;


public class DBManager {

	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = 
			Resources.getResourceAsReader("com/example/demo/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	// 자유게시판
	public static List<BoardVo> listBoard(HashMap map){

		SqlSession session = factory.openSession();
		List<BoardVo> list = session.selectList("board.findAll", map);
		session.close();
		return list;
	}
	
	public static int insertBoard(BoardVo b) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("board.insert", b);
		session.close();
		return re;
	}
	
	public static BoardVo getBoard(int board_num) {
		SqlSession session = factory.openSession();
		BoardVo b = session.selectOne("board.getBoard", board_num);
		session.close();
		return b;
	}
	
	public static int deleteBoard(int board_num) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("board.delete", board_num);
		session.close();
		return re;
	}
	
	public static void updateHit(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("board.updateHit", board_num);
		session.close();
	}
	
	public static int getTotalRecord() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("board.totalRecord");
		session.close();
		return n;
	}
	
	// 거래게시판 목록 조회
	public static List<DealVo> listDeal(){
		SqlSession session = factory.openSession();
		List<DealVo> list = session.selectList("deal.findAll");
		session.close();
		return list;
	}
	
	// 거래게시판 글쓰기
	public static int insertDeal(DealVo d) {
		SqlSession session = factory.openSession();
		int re = session.insert("deal.insertDeal1", d);
		re += session.insert("deal.insertDeal2", d);
		session.close();
		return re;
	}

	// 마이페이지
	public static MemberVo getMember(int member_num) {
		SqlSession session = factory.openSession();
		MemberVo mb = session.selectOne("member.getMember", member_num);
		session.close();
		return mb; 
	}
	
	public static PetVo getPet(int member_num) {
		SqlSession session = factory.openSession();
		PetVo pet = session.selectOne("pet.getPet", member_num);
		session.close();
		return pet;
	}
	
}