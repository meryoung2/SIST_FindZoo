package com.example.demo.db;

import java.io.Reader;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.FreeVo;
import com.example.demo.vo.MemberBoardVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.NoteVo;
import com.example.demo.vo.PetVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.BohoVo;
import com.example.demo.vo.DealVo;
import com.example.demo.vo.FindVo;

public class DBManager {

	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
	}

	//////////////////////////////////////// 게시판 시작 ////////////////////////////////////////

	// 자유게시판 목록
	public static List<FreeVo> free(HashMap map) {
		SqlSession session = factory.openSession();
		List<FreeVo> list = session.selectList("free.findAll", map);
		session.close();
		return list;
	}

	// 자유게시판 검색 후 목록 조회
	public static List<FreeVo> searchFree(HashMap map) {
		SqlSession session = factory.openSession();
		List<FreeVo> list = session.selectList("free.search", map);
		session.close();
		return list;
	}

	// 자유게시판 조회수 증가
	public static void updateViews(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("free.updateViews", board_num);
		session.close();
	}

	// 자유게시판 전체 글 갯수
	public static int getTotalRecordFree() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("free.totalRecord");
		session.close();
		return n;
	}

	// 자유게시판 검색 글 갯수
	public static int getSearchRecordFree(HashMap num_map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("free.searchRecord", num_map);
		session.close();
		return n;
	}

	// 자유게시판 글 내용 상세
	public static FreeVo getFree(int board_num) {
		SqlSession session = factory.openSession();
		FreeVo f = session.selectOne("free.getFree", board_num);
		session.close();
		return f;
	}

	// 자유게시판 글 작성
	public static int insertFree(FreeVo f) {
		SqlSession session = factory.openSession();
		int free_re = session.insert("free.insert", f);
		int picture_re = session.insert("free.insertPicture", f);
		int re = 0;

		if (free_re == 1 && picture_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}

		session.close();
		return re;
	}

	// 자유게시판 글 수정
	public static int updateFree(FreeVo f) {
		SqlSession session = factory.openSession();
		int free_re = session.update("free.update", f);
		int picture_re = session.update("free.updatePicture", f);

		int re = 0;

		if (free_re == 1 && picture_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}

		session.close();
		return re;
	}

	// 자유게시판 글 삭제
	public static int deleteFree(int board_num) {
		SqlSession session = factory.openSession();
		int picture_re = session.delete("free.deletePicture", board_num);
		int free_re = session.delete("free.delete", board_num);
		int re = 0;

		if (free_re == 1 && picture_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}

		session.close();
		return re;
	}

	// 거래게시판 목록 조회
	public static List<DealVo> deal(HashMap map) {
		SqlSession session = factory.openSession();
		List<DealVo> list = session.selectList("deal.findAll", map);
		session.close();
		return list;
	}

	// 거래게시판 검색 후 목록 조회
	public static List<DealVo> searchDeal(HashMap map) {
		SqlSession session = factory.openSession();
		List<DealVo> list = session.selectList("deal.search", map);
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
		if (board_re == 1 && deal_re == 1 && pic_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 거래게시판 특정 게시글 상세 내용을 위한 넘버링갖고오는 메소드
	public static DealVo getDeal(int board_num) {
		SqlSession session = factory.openSession();
		DealVo d = session.selectOne("deal.getBoard", board_num);
		session.close();
		return d;
	}

	// 거래게시판 글, 사진 수정
	public static int updateDeal(DealVo d) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int deal_re = session.update("deal.updateDeal", d);
		int board_re = session.update("deal.updateBoard", d);
		int pic_re = session.update("deal.updateDealPicture", d);

		if (pic_re == 1 && deal_re == 1 && board_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 거래게시판 삭제
	public static int deleteDeal(int board_num) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int deal_re = session.delete("deal.deleteDeal", board_num);
		int pic_re = session.delete("deal.deleteDealPicture", board_num);
		int board_re = session.delete("deal.deleteBoard", board_num);

		if (deal_re == 1 && board_re == 1 && pic_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 거래게시판 조회수 증가
	public static void updateViewsDeal(int board_num) {
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

	// 거래게시판 검색 글 갯수
	public static int getSearchRecordDeal(HashMap num_map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("deal.searchRecord", num_map);
		session.close();
		return n;
	}

	// 찾아요게시판 목록 조회
	public static List<FindVo> find(HashMap map) {
		SqlSession session = factory.openSession();
		List<FindVo> list = session.selectList("find.findAll", map);
		session.close();
		return list;
	}
	
	// 찾아요게시판 목록에 해당하는 사진 불러오기
	public static List<String> findPicture(HashMap map_pic) {
		SqlSession session = factory.openSession();
		List<String> p = session.selectList("find.findAllPicture", map_pic);
		System.out.println(p.size());
		session.close();
		return p;
	}

	// 찾아요게시판 검색 후 목록 조회
	public static List<FindVo> searchFind(HashMap map) {
		SqlSession session = factory.openSession();
		List<FindVo> list = session.selectList("find.search", map);
		session.close();
		return list;
	}
	
	// 찾아요게시판 검색 후 목록에 해당하는 사진 불러오기
		public static List<String> searchFindPicture(HashMap map_pic) {
			SqlSession session = factory.openSession();
			List<String> p = session.selectList("find.searchPicture", map_pic);
			System.out.println(p.size());
			session.close();
			return p;
		}

	// 찾아요게시판 글쓰기
	public static int insertFind(FindVo f) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		
		int pic_re1 = 0;
		int pic_re2 = 0;
		int pic_re3 = 0;
		
		int board_re = session.insert("find.insertBoard", f);
		int find_re = session.insert("find.insertFind", f);
		
		if(board_re == 1 && find_re == 1) {
			pic_re1 = session.insert("find.insertFindPicture1", f);
			pic_re2 = session.insert("find.insertFindPicture2", f);
			pic_re3 = session.insert("find.insertFindPicture3", f);
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 찾아요게시판 특정 게시글 상세 내용 불러오기 메소드
	public static FindVo getFind(int board_num) {
		SqlSession session = factory.openSession();
		FindVo f = session.selectOne("find.getBoard", board_num);
		List<String> p = getFindPicture(board_num);
		List<String> n = getFindPictureNum(board_num);
		String p1 = p.get(0);
		String p2 = p.get(1);
		String p3 = p.get(2);
		
		String n1 = n.get(0);
		String n2 = n.get(1);
		String n3 = n.get(2);
		
		f.setPicture_fname1(p1);
		f.setPicture_fname2(p2);
		f.setPicture_fname3(p3);
		
		f.setPicture_file_num1(n1);
		f.setPicture_file_num2(n2);
		f.setPicture_file_num3(n3);
		
		session.close();
		return f;
	}
	
	// 찾아요게시판 특정 게시글 의 사진 불러오기 메소드
	public static List<String> getFindPicture(int board_num) {
		SqlSession session = factory.openSession();
		List<String> p = session.selectList("find.getPicture", board_num);
		session.close();
		return p;
	}
	
	// 찾아요게시판 특정 게시글 의 사진번호 불러오기 메소드
	public static List<String> getFindPictureNum(int board_num) {
		SqlSession session = factory.openSession();
		List<String> n = session.selectList("find.getPictureNum", board_num);
		session.close();
		return n;
	}

	// 찾아요게시판 글, 사진 수정
	public static int updateFind(FindVo f) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int find_re = session.update("find.updateFind", f);
		int board_re = session.update("find.updateBoard", f);
		
		if(board_re == 1 && find_re == 1) {
			int pic_re1 = session.update("find.updateFindPicture1", f);
			int pic_re2 = session.update("find.updateFindPicture2", f);
			int pic_re3 = session.update("find.updateFindPicture3", f);
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		
		session.close();
		return re;
	}

	// 찾아요게시판 삭제
	public static int deleteFind(int board_num) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int find_re = session.delete("find.deleteFind", board_num);
		System.out.println(find_re);
		int pic_re = session.delete("find.deleteFindPicture", board_num);
		System.out.println(pic_re);
		int board_re = session.delete("find.deleteBoard", board_num);
		System.out.println(board_re);


		if (find_re == 1 && board_re == 1 && pic_re == 3) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 찾아요게시판 조회수 증가
	public static void updateViewsFind(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("find.updateHit", board_num);
		session.close();
	}

	// 찾아요게시판 전체 글 갯수
	public static int getTotalRecordFind() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("find.totalRecord");
		session.close();
		return n;
	}

	// 찾아요게시판 검색 글 갯수
	public static int getSearchRecordFind(HashMap num_map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("find.searchRecord", num_map);
		session.close();
		return n;
	}

	// 특정 회원의 닉네임 출력
	public static String getNick(int member_num) {
		SqlSession session = factory.openSession();
		String mn = session.selectOne("memberBoard.getNick", member_num);
		session.close();
		return mn;
	}
	
	// 특정 회원이 작성한 목록 출력
	public static List<MemberBoardVo> memberBoard(HashMap map) {
		SqlSession session = factory.openSession();
		List<MemberBoardVo> list = session.selectList("memberBoard.findAll", map);
		session.close();
		return list;
	}

	// 특정 회원이 작성한 전체 글 갯수
	public static int getTotalRecordMemberBoard(int member_num) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("memberBoard.totalRecord", member_num);
		session.close();
		return n;
	}
	
	// 게시판 댓글 목록 조회
	public static List<ReplyVo> listReply(int board_num) {
		SqlSession session = factory.openSession();
		List<ReplyVo> list = session.selectList("reply.findAll", board_num);
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

	// 댓글수정
	public static int updateReply(ReplyVo r) {
		SqlSession session = factory.openSession(true);
		int re = session.update("reply.updateReply", r);
		session.close();
		return re;
	}

	// 댓글삭제
	public static int deleteReply(int reply_num) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("reply.deleteReply", reply_num);
		session.close();
		return re;
	}

	// 대댓글 쓰기
	public static int insertReReply(ReplyVo r) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("reply.insertReReply", r);
		session.close();
		return re;
	}

	//////////////////////////////////////// 게시판 끝 ////////////////////////////////////////

	//////////////////////////////////////// 진솔 시작 ////////////////////////////////////////

	// 회원가입 회원추가
	public static int insertMember(MemberVo m) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("member.insert", m);
		session.commit();
		session.close();
		return re;
	}

	// 로그인 시, 아이디/패스워드 일치 여부
	public static boolean isMember(String member_id, String member_pwd) {
		boolean re = false;
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		MemberVo m = session.selectOne("member.isMember", map);
		if (m != null) {
			re = true;
		}
		session.close();
		return re;
	}

	// 로그인 시, 해당 아이디에 대한 정보 불러오기
	public static MemberVo loginMember(String member_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		MemberVo m = session.selectOne("member.loginMember", member_id);
		session.close();
		return m;
	}

	// 회원가입 시, 아이디 중복체크
	public static int idChk(String member_id) {
		int re = 0;
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("member_id", member_id);
		int result = session.selectOne("member.idChk", map);
		if (result >= 1) {
			re = 409;
		} else {
			re = 200;
		}
		System.out.println(result + "아이디 중복체크");
		session.close();
		return re;
	}

	// 회원가입 시, 닉네임 중복체크
	public static int nickChk(String member_nick) {
		int re = 0;
		SqlSession session = factory.openSession();
		HashMap map = new HashMap();
		map.put("member_nick", member_nick);
		int result = session.selectOne("member.nickChk", map);
		if (result >= 1) {
			re = 409;
		} else {
			re = 200;
		}
		System.out.println(result + "닉네임 중복체크");
		session.close();
		return re;
	}

	// 로그인 시, 아이디 찾기
	public static Map findId(String member_name, String member_phone) {
		SqlSession session = factory.openSession();
		
		System.out.println(member_name);
		Map map = new HashMap();
		map.put("member_name", member_name);
		map.put("member_phone", member_phone);
		MemberVo m = session.selectOne("member.findId", map);
			if(m != null) {
				map.put("member_id", m.getMember_id());
				map.put("code", 200);
			} else {
				map.put("code", 204);
			}	
		session.close();
		return map;
	}
	
	//비밀번호 찾기할 때, 멤버넘 조회해서 1이면 ok 0이면 false
	public static int selectPwd(MemberVo mb) {
		SqlSession session = factory.openSession();
		int re = session.selectOne("member.selectPwd", mb);
		session.close();
		return re;
	}
	
	
	//비밀번호 찾기 / 비밀번호 재설정
		public static int newPwd(MemberVo mb) {
			SqlSession session = factory.openSession(true);
			int re = session.update("member.newPwd", mb);
			session.close();
			return re;
		}
		
		
		// 메인에서 찾아요게시판 조회
		public static List<FindVo> mainFind() {
			SqlSession session = factory.openSession();
			List<FindVo> list = session.selectList("main.mainFind");
			session.close();
			return list;
		}
		
		// 메인에서 찾아요게시판 목록 사진 불러오기
		public static List<String> mainFindPicture() {
			SqlSession session = factory.openSession();
			List<String> p = session.selectList("main.mainFindPicture");
			System.out.println(p.size());
			session.close();
			return p;
		}
		

	//////////////////////////////////////// 진솔 끝 ////////////////////////////////////////

	//////////////////////////////////////// 마이페이지 시작 ////////////////////////////////////////

	// 내 정보 상세 조회
	public static MemberVo getMember(int member_num) {
		SqlSession session = factory.openSession();
		MemberVo mb = session.selectOne("member.getMember", member_num);
		session.close();
		return mb;
	}

	// 내 정보 전체 수정
	public static int updateInfo(MemberVo mb) {
		SqlSession session = factory.openSession(true);
		int re = session.update("member.updateInfo", mb);
		session.close();
		return re;
	}

	// 비밀번호 변경
	public static int updatePwd(MemberVo mb) {
		SqlSession session = factory.openSession(true);
		int re = session.update("member.updatePwd", mb);
		session.close();
		return re;
	}

	// 닉네임 중복 확인
	public static boolean checkNick(String member_nick) {
		boolean flag = false;
		SqlSession session = factory.openSession(true);
		int re = session.selectOne("member.checkNick", member_nick);
		// count(*) 값이 0이면 없는(false) 닉네임, 1이면 존재하는(true) 닉네임.
		// 혹시라도 중복 된 닉네임이 이미 있을 경우를 대비해서 re == 1 대신 re > 0
		if (re > 0) {
			flag = true;
		}
		session.close();
		return flag;
	}

	// 회원 탈퇴(해당 회원의 정보나 게시물을 실제로 삭제하지 않고 일부 정보만 수정하여 접근을 제한)
	public static int deleteChangeInfo(MemberVo mb) {
		SqlSession session = factory.openSession(true);
		int re = session.update("member.deleteChangeInfo", mb);
		session.close();
		return re;
	}
	
	// 내 정보에 반려동물(들) 이름 출력
	public static List<PetVo> listPet(int member_num) {
		SqlSession session = factory.openSession();
		List<PetVo> list = session.selectList("pet.listPet", member_num);
		session.close();
		return list;
	}

	// 반려동물 정보 상세 조회
	public static PetVo detailPet(int pet_num) {
		SqlSession session = factory.openSession();
		PetVo pet = session.selectOne("pet.detailPet", pet_num);
		session.close();
		return pet;
	}

	// 반려동물 추가
	public static int insertPet(PetVo pet) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("pet.insertPet", pet);
		session.close();
		return re;
	}

	// 반려동물 삭제
	public static int deletePet(int pet_num) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("pet.deletePet", pet_num);
		session.close();
		return re;
	}
	
	// 보낸 쪽지함
	public static List<NoteVo> sendNoteList(int note_sender_num) {
		SqlSession session = factory.openSession();
		List<NoteVo> list = session.selectList("note.sendNoteList", note_sender_num);
		session.close();
		return list;
	}
	
	// 보낸 쪽지함 사이드바 링크 연결을 위한 member_num, member_pwd
	public static NoteVo getSenderInfo(int note_sender_num) {
		SqlSession session = factory.openSession();
		NoteVo nt = session.selectOne("note.getSenderInfo", note_sender_num);
		session.close();
		return nt;
	}
	
	// 받은 쪽지함
	public static List<NoteVo> receiveNoteList(int note_receiver_num) {
		SqlSession session = factory.openSession();
		List<NoteVo> list = session.selectList("note.receiveNoteList", note_receiver_num);
		session.close();
		return list;
	}
	
	// 받은 쪽지함 사이드바 링크 연결을 위한 member_num, member_pwd
	public static NoteVo getReceiverInfo(int note_receiver_num) {
		SqlSession session = factory.openSession();
		NoteVo nt = session.selectOne("note.getReceiverInfo", note_receiver_num);
		session.close();
		return nt;
	}

	// 보낸 쪽지 내용 상세 조회 + 해당 쪽지를 받는 사람의 정보
	public static NoteVo detailSendNote(int note_num) {
		SqlSession session = factory.openSession();
		NoteVo nt = session.selectOne("note.detailSendNote", note_num);
		session.close();
		return nt;
	}
	
	// 받은 쪽지 내용 상세 조회 + 해당 쪽지를 보낸(답장시 쪽지를 받을) 사람의 정보
	public static NoteVo detailReceiveNote(int note_num) {
		SqlSession session = factory.openSession();
		NoteVo nt = session.selectOne("note.detailReceiveNote", note_num);
		session.close();
		return nt;
	}
	
	// 쪽지 답장
	public static int sendReplyNote(NoteVo nt) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("note.sendReplyNote", nt);
		session.close();
		return re;
	}

	/* 해당 쪽지 삭제
	public static int deleteNote(int note_num) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("note.deleteNote", note_num);
		session.close();
		return re;
	} */
	
	// 보낸 쪽지함에서 쪽지 선택 삭제시, 보낸 사람의 회원번호를 관리자 번호인 -1로 변경하여 보낸 쪽지함 목록에서 제외
	public static int deleteChangeSenderNum(int note_num) {
		SqlSession session = factory.openSession(true);
		int re = session.update("note.deleteChangeSenderNum", note_num);
		session.close();
		return re;
	}
	
	// 받은 쪽지함에서 쪽지 선택 삭제시, 받은 사람의 회원번호를 관리자 번호인 -1로 변경하여 받은 쪽지함 목록에서 제외
	public static int deleteChangeReceiverNum(int note_num) {
		SqlSession session = factory.openSession(true);
		int re = session.update("note.deleteChangeReceiverNum", note_num);
		session.close();
		return re;
	}

	//////////////////////////////////////// 마이페이지 끝 ////////////////////////////////////////
}