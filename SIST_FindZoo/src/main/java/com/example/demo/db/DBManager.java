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
	
	// 자유게시판 목록
	public static List<BoardVo> listBoard(HashMap map){
		SqlSession session = factory.openSession();
		List<BoardVo> list = session.selectList("board.findAll", map);
		session.close();
		return list;
	}
	
	// 자유게시판 조회수 증가
	public static void updateViews(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("board.updateViews", board_num);
		session.close();
	}
		
	// 자유게시판 전체 글 갯수
	public static int getTotalRecord() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("board.totalRecord");
		session.close();
		return n;
	}
	
	// 자유게시판 글 내용 상세
	public static BoardVo getBoard(int board_num) {
		SqlSession session = factory.openSession();
		BoardVo b = session.selectOne("board.getBoard", board_num);
		session.close();
		return b;
	}

	// 자유게시판 글 작성
	public static int insertBoard(BoardVo b) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("board.insert", b);
		session.close();
		return re;
	}
	
	// 자유게시판 글 삭제
	public static int deleteBoard(int board_num) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("board.delete", board_num);
		session.close();
		return re;
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
}