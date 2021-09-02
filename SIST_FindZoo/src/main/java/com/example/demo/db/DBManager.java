package com.example.demo.db;

import java.io.Reader;
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
	
	// 
	
	public static List<BoardVo> listBoard(){
		SqlSession session = factory.openSession();
		List<BoardVo> list = session.selectList("board.findAll");
		session.close();
		return list;
	}
	
	public static int insertBoard(BoardVo b) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("board.insert", b);
		session.close();
		return re;
	}
	
	public static BoardVo getBoard(int no) {
		SqlSession session = factory.openSession();
		BoardVo b = session.selectOne("board.getBoard", no);
		session.close();
		return b;
	}
	
	public static int updateBoard(BoardVo b) {
		SqlSession session = factory.openSession(true);
		int re = session.update("board.update", b);
		session.close();
		return re;
	}
	
	public static int deleteBoard(int no, String pwd) {
		SqlSession session = factory.openSession(true);
		HashMap map = new HashMap();
		map.put("no", no);
		map.put("pwd", pwd);
		int re = session.delete("board.delete", map);
		session.close();
		return re;
	}

	public static int getNextNo() {
		SqlSession session = factory.openSession();
		int no = session.selectOne("board.getNextNo");
		session.close();
		return no;
	}
	
	public static void updateHit(int no) {
		SqlSession session = factory.openSession(true);
		session.update("board.updateHit", no);
		session.close();
	}
}







