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
import com.example.demo.vo.ReplyVo;
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
		SqlSession session = factory.openSession();
		int reBoard = session.insert("board.insert", b);
		int rePicture = session.insert("board.insertPicture", b);
		int re = 0;
		
		if(reBoard == 1 && rePicture == 1) {
			session.commit();
			re = 1;
		}else {
			session.rollback();
		}
		
		session.close();
		return re;
	}
	
	// 자유게시판 글 삭제
	public static int deleteBoard(int board_num) {
		SqlSession session = factory.openSession();
		int rePicture = session.delete("board.deletePicture", board_num);
		int reBoard = session.delete("board.delete", board_num);
		int re = 0;
		
		if(reBoard == 1 && rePicture == 1) {
			session.commit();
			re = 1;
		}else {
			session.rollback();
		}
		
		session.close();
		return re;
	}
	
	// 거래게시판 목록 조회
	public static List<DealVo> listDeal(HashMap map){
		SqlSession session = factory.openSession();
		List<DealVo> list = session.selectList("deal.findAll");
		session.close();
		return list;
	}

	// 거래게시판 글쓰기
	public static int insertDeal(DealVo d) {
		SqlSession session = factory.openSession(false);
		int re = -1;		
		int board_re = session.insert("deal.insertBoard", d);
		int deal_re = session.insert("deal.insertDeal", d);
		int pic_re = session.insert("deal.insertDealPicture", d);
		if(board_re == 1 && deal_re == 1 && pic_re == 1) {
			session.commit();
			re = 1;
		}else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 거래게시판 글 상세 내용을 위한 메소드
	public static DealVo getDeal(int board_num) {
		SqlSession session = factory.openSession();
		DealVo d = session.selectOne("deal.getBoard", board_num);
		session.close();
		return d;
	}
	
	// 거래게시판 조회수 증가
	public static void updateDealHit(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("deal.updateHit", board_num);
		session.close();
	}
	
	// 거래게시판 전체 글 갯수
	public static int getTotalRecordDeal() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("deal.totalRecord");
		session.close();
		return n;
	}
	
	// 마이페이지 내 정보 조회
	public static MemberVo getMember(int member_num) {
		SqlSession session = factory.openSession();
		MemberVo mb = session.selectOne("member.getMember", member_num);
		session.close();
		return mb; 
	}
	
	// 마이페이지 내 정보 수정
	public static int updateInfo(MemberVo mb) {
		SqlSession session = factory.openSession(true);
		int re = session.update("member.updateInfo", mb);
		session.close();
		return re;
	}
	
	// 마이페이지에 반려동물 이름 리스트 출력
	public static List<PetVo> listPet(int member_num) {
		SqlSession session = factory.openSession();
		List<PetVo> list = session.selectList("pet.listPet", member_num);
		session.close();
		return list;
	}
	
	// 마이페이지 반려동물 정보 상세 조회
	public static PetVo detailPet(int pet_num) {
		SqlSession session = factory.openSession();
		PetVo pet = session.selectOne("pet.detailPet", pet_num);
		session.close();
		return pet; 
	}
	
	// 마이페이지 반려동물 추가
	public static int insertPet(PetVo pet) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("pet.insertPet", pet);
		session.close();
		return re;
	}
	
	// 마이페이지 반려동물 삭제
	public static int deletePet(int pet_num) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("pet.deletePet", pet_num);
		session.close();
		return re;
	}
	
	// 회원가입, 로그인
	public static MemberVo loginMember(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	public static int insertMember(MemberVo m) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public static List<ReplyVo> listReply(){
		SqlSession session = factory.openSession();
		List<ReplyVo> list = session.selectList("reply.findAll");
		session.close();
		return list;
	}

	// 댓글 쓰기
	public static int insertReply(ReplyVo r) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("reply.insert", r);
		session.close();
		return re;
	}
}
