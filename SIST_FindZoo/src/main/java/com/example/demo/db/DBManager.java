package com.example.demo.db;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.MemberVo;

public class DBManager {
	private static SqlSessionFactory factory;
	static {
		try {
			
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			System.out.println("예외발생 :" + e.getMessage());
		}
	}
	
	public static int insertMember(MemberVo m) {
		SqlSession session = factory.openSession();
		int re = session.insert("member.insert", m);
		session.close();
		return re;
	}
	
	public static MemberVo getMember(String username) {
		SqlSession session = factory.openSession();
		MemberVo m = session.selectOne("member.getMember",username);
		session.close();
		return m;
	}
	
}
