package com.example.demo.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.BoardVo;

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
}







