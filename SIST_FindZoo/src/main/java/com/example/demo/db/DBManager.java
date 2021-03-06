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
import com.example.demo.vo.MyPostVo;
import com.example.demo.vo.MyReplyVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.NoteVo;
import com.example.demo.vo.PetVo;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.SeeVo;
import com.example.demo.vo.VolunteerVo;
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

	
	// 찾은후기 목록
		public static List<FreeVo> FindReview(HashMap map) {
			SqlSession session = factory.openSession();
			List<FreeVo> list = session.selectList("findreview.findAll", map);
			session.close();
			return list;
		}

		// 찾은후기 검색 후 목록 조회
		public static List<FreeVo> searchFindReview(HashMap map) {
			SqlSession session = factory.openSession();
			List<FreeVo> list = session.selectList("findreview.search", map);
			session.close();
			return list;
		}

		// 찾은후기 조회수 증가
		public static void updateViewsFindReview(int board_num) {
			SqlSession session = factory.openSession(true);
			session.update("findreview.updateViewsFindReview", board_num);
			session.close();
		}

		// 찾은후기 전체 글 갯수
		public static int getTotalRecordFindReview() {
			SqlSession session = factory.openSession();
			int n = session.selectOne("findreview.totalRecord");
			session.close();
			return n;
		}

		// 찾은후기 검색 글 갯수
		public static int getSearchRecordFindReview(HashMap num_map) {
			SqlSession session = factory.openSession();
			int n = session.selectOne("findreview.searchRecord", num_map);
			session.close();
			return n;
		}

		// 찾은후기 글 내용 상세
		public static FreeVo getFindReview(int board_num) {
			SqlSession session = factory.openSession();
			FreeVo f = session.selectOne("findreview.getFindReview", board_num);
			session.close();
			return f;
		}

		// 찾은후기 글 작성
		public static int insertFindReview(FreeVo f) {
			SqlSession session = factory.openSession();
			int free_re = session.insert("findreview.insert", f);
			int picture_re = session.insert("findreview.insertPicture", f);
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

		// 찾은후기 글 수정
		public static int updateFindReview(FreeVo f) {
			SqlSession session = factory.openSession();
			int free_re = session.update("findreview.update", f);
			int picture_re = session.update("findreview.updatePicture", f);

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

		// 찾은후기 글 삭제
		public static int deleteFindReview(int board_num) {
			SqlSession session = factory.openSession();
			int picture_re = session.delete("findreview.deletePicture", board_num);
			int free_re = session.delete("findreview.delete", board_num);
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
		
		
	//정보공유 목록
	public static List<FreeVo> information(HashMap map) {
		SqlSession session = factory.openSession();
		List<FreeVo> list = session.selectList("information.findAll", map);	
		session.close();
		return list;
	}

	//정보공유 검색 후 목록 조회
	public static List<FreeVo> searchInformation(HashMap map) {
		SqlSession session = factory.openSession();
		List<FreeVo> list = session.selectList("information.search", map);
		session.close();
		return list;
	}

	//정보공유 조회수 증가
	public static void updateViewsInformation(int board_num) {	
		SqlSession session = factory.openSession(true);
		session.update("information.updateViewsInformation", board_num);
		session.close();
		}

	//정보공유 전체 글 갯수
	public static int getTotalRecordInformation() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("information.totalRecord");
		session.close();
		return n;
		}

	//정보공유 검색 글 갯수
	public static int getSearchRecordInformation(HashMap num_map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("information.searchRecord", num_map);
		session.close();
		return n;
		}

	//정보공유 글 내용 상세
	public static FreeVo getInformation(int board_num) {
		SqlSession session = factory.openSession();
		FreeVo f = session.selectOne("information.getInformation", board_num);
		session.close();
		return f;
		}

	//정보공유 글 작성
	public static int insertInformation(FreeVo f) {
		SqlSession session = factory.openSession();
		int free_re = session.insert("information.insert", f);
		int picture_re = session.insert("information.insertPicture", f);
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
	
	//정보공유 글 수정
	public static int updateInformation(FreeVo f) {
		SqlSession session = factory.openSession();
		int free_re = session.update("information.update", f);
		int picture_re = session.update("information.updatePicture", f);

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

	//정보공유 글 삭제
	public static int deleteInformation(int board_num) {
		SqlSession session = factory.openSession();
		int picture_re = session.delete("information.deletePicture", board_num);
		int free_re = session.delete("information.delete", board_num);
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

	// 보호중게시판 목록 조회
	public static List<BohoVo> boho(HashMap map) {
		SqlSession session = factory.openSession();
		List<BohoVo> list = session.selectList("boho.findAll", map);
		session.close();
		return list;
	}
	
	// 보호중게시판 목록에 해당하는 사진 불러오기
	public static List<String> bohoPicture(HashMap map_pic) {
		SqlSession session = factory.openSession();
		List<String> p = session.selectList("boho.findAllPicture", map_pic);
		System.out.println(p.size());
		session.close();
		return p;
	}
	
	// 보호중게시판 검색 후 목록 조회
	public static List<BohoVo> searchBoho(HashMap map) {
		SqlSession session = factory.openSession();
		List<BohoVo> list = session.selectList("boho.search", map);
		session.close();
		return list;
	}
	
	// 보호중게시판 검색 후 목록에 해당하는 사진 불러오기
	public static List<String> searchBohoPicture(HashMap map_pic) {
		SqlSession session = factory.openSession();
		List<String> p = session.selectList("boho.searchPicture", map_pic);
		System.out.println(p.size());
		session.close();
		return p;
	}
	
	// 보호중게시판 글쓰기
	public static int insertBoho(BohoVo bh) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		
		int pic_re1 = 0;
		int pic_re2 = 0;
		int pic_re3 = 0;
		
		int board_re = session.insert("boho.insertBoard", bh);
		int boho_re = session.insert("boho.insertBoho", bh);
		
		if(board_re == 1 && boho_re == 1) {
			pic_re1 = session.insert("boho.insertBohoPicture1", bh);
			pic_re2 = session.insert("boho.insertBohoPicture2", bh);
			pic_re3 = session.insert("boho.insertBohoPicture3", bh);
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}
	
	// 보호중게시판 특정 게시글 상세 내용 불러오기 메소드
	public static BohoVo getBoho(int board_num) {
		SqlSession session = factory.openSession();
		BohoVo bh = session.selectOne("boho.getBoard", board_num);
		List<String> p = getBohoPicture(board_num);
		List<String> n = getBohoPictureNum(board_num);
		String p1 = p.get(0);
		String p2 = p.get(1);
		String p3 = p.get(2);
		
		String n1 = n.get(0);
		String n2 = n.get(1);
		String n3 = n.get(2);
		
		bh.setPicture_fname1(p1);
		bh.setPicture_fname2(p2);
		bh.setPicture_fname3(p3);
		
		bh.setPicture_file_num1(n1);
		bh.setPicture_file_num2(n2);
		bh.setPicture_file_num3(n3);
		
		session.close();
		return bh;
	}
	
	// 보호중게시판 특정 게시글 의 사진 불러오기 메소드
	public static List<String> getBohoPicture(int board_num) {
		SqlSession session = factory.openSession();
		List<String> p = session.selectList("boho.getPicture", board_num);
		session.close();
		return p;
	}
	
	// 보호중게시판 특정 게시글 의 사진번호 불러오기 메소드
	public static List<String> getBohoPictureNum(int board_num) {
		SqlSession session = factory.openSession();
		List<String> n = session.selectList("boho.getPictureNum", board_num);
		session.close();
		return n;
	}
	
	// 보호중게시판 글, 사진 수정
	public static int updateBoho(BohoVo bh) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int boho_re = session.update("boho.updateBoho", bh);
		int board_re = session.update("boho.updateBoard", bh);
		
		if(board_re == 1 && boho_re == 1) {
			int pic_re1 = session.update("boho.updateBohoPicture1", bh);
			int pic_re2 = session.update("boho.updateBohoPicture2", bh);
			int pic_re3 = session.update("boho.updateBohoPicture3", bh);
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		
		session.close();
		return re;
	}
	
	// 보호중게시판 삭제
	public static int deleteBoho(int board_num) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int boho_re = session.delete("boho.deleteBoho", board_num);
		int pic_re = session.delete("boho.deleteBohoPicture", board_num);
		int board_re = session.delete("boho.deleteBoard", board_num);
		
		
		if (boho_re == 1 && board_re == 1 && pic_re == 3) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}
	
	// 보호중게시판 조회수 증가
	public static void updateViewsBoho(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("boho.updateHit", board_num);
		session.close();
	}
	
	// 보호중게시판 전체 글 갯수
	public static int getTotalRecordBoho() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("boho.totalRecord");
		session.close();
		return n;
	}
	
	// 보호중게시판 검색 글 갯수
	public static int getSearchRecordBoho(HashMap num_map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("boho.searchRecord", num_map);
		session.close();
		return n;
	}
	
	// 목격했어요 게시판 목록 조회
	public static List<SeeVo> see(HashMap map) {
		SqlSession session = factory.openSession();
		List<SeeVo> list = session.selectList("see.findAll", map);
		session.close();
		return list;
	}

	// 목격했어요 게시판 검색 후 목록 조회
	public static List<SeeVo> searchSee(HashMap map) {
		SqlSession session = factory.openSession();
		List<SeeVo> list = session.selectList("see.search", map);
		session.close();
		return list;
	}

	// 목격했어요 게시판 글쓰기
	public static int insertSee(SeeVo s) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int board_re = session.insert("see.insertBoard", s);
		int see_re = session.insert("see.insertSee", s);
		int pic_re = session.insert("see.insertSeePicture", s);
		if (board_re == 1 && see_re == 1 && pic_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 목격했어요 게시판 특정 게시글 상세 내용을 위한 넘버링갖고오는 메소드
	public static SeeVo getSee(int board_num) {
		SqlSession session = factory.openSession();
		SeeVo s = session.selectOne("see.getBoard", board_num);
		session.close();
		return s;
	}

	// 목격했어요 게시판 글, 사진 수정
	public static int updateSee(SeeVo s) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int see_re = session.update("see.updateSee", s);
		int board_re = session.update("see.updateBoard", s);
		int pic_re = session.update("see.updateSeePicture", s);

		if (pic_re == 1 && see_re == 1 && board_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 목격했어요 게시판 삭제
	public static int deleteSee(int board_num) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int see_re = session.delete("see.deleteSee", board_num);
		int pic_re = session.delete("see.deleteSeePicture", board_num);
		int board_re = session.delete("see.deleteBoard", board_num);

		if (see_re == 1 && board_re == 1 && pic_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 목격했어요 게시판 조회수 증가
	public static void updateViewsSee(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("see.updateHit", board_num);
		session.close();
	}

	// 목격했어요 게시판 전체 글 갯수
	public static int getTotalRecordSee() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("see.totalRecord");
		session.close();
		return n;
	}

	// 목격했어요 게시판 검색 글 갯수
	public static int getSearchRecordSee(HashMap num_map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("see.searchRecord", num_map);
		session.close();
		return n;
	}

	// 자원봉사 게시판 목록 조회
	public static List<VolunteerVo> vol(HashMap map) {
		SqlSession session = factory.openSession();
		List<VolunteerVo> list = session.selectList("vol.findAll", map);
		session.close();
		return list;
	}

	// 자원봉사 게시판 검색 후 목록 조회
	public static List<VolunteerVo> searchVol(HashMap map) {
		SqlSession session = factory.openSession();
		List<VolunteerVo> list = session.selectList("vol.search", map);
		session.close();
		return list;
	}

	// 자원봉사 게시판 글쓰기
	public static int insertVol(VolunteerVo v) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int board_re = session.insert("vol.insertBoard", v);
		int vol_re = session.insert("vol.insertVol", v);
		int pic_re = session.insert("vol.insertVolPicture", v);
		if (board_re == 1 && vol_re == 1 && pic_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 자원봉사 게시판 특정 게시글 상세 내용을 위한 넘버링갖고오는 메소드
	public static VolunteerVo getVol(int board_num) {
		SqlSession session = factory.openSession();
		VolunteerVo v = session.selectOne("vol.getBoard", board_num);
		session.close();
		return v;
	}

	// 자원봉사 게시판 글, 사진 수정
	public static int updateVol(VolunteerVo v) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int vol_re = session.update("vol.updateVol", v);
		int board_re = session.update("vol.updateBoard", v);
		int pic_re = session.update("vol.updateVolPicture", v);

		if (pic_re == 1 && vol_re == 1 && board_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 자원봉사 게시판 삭제
	public static int deleteVol(int board_num) {
		SqlSession session = factory.openSession(false);
		int re = -1;
		int vol_re = session.delete("vol.deleteVol", board_num);
		int pic_re = session.delete("vol.deleteVolPicture", board_num);
		int board_re = session.delete("vol.deleteBoard", board_num);

		if (vol_re == 1 && board_re == 1 && pic_re == 1) {
			session.commit();
			re = 1;
		} else {
			session.rollback();
		}
		session.close();
		return re;
	}

	// 자원봉사 게시판 조회수 증가
	public static void updateViewsVol(int board_num) {
		SqlSession session = factory.openSession(true);
		session.update("vol.updateHit", board_num);
		session.close();
	}

	// 자원봉사 게시판 전체 글 갯수
	public static int getTotalRecordVol() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("vol.totalRecord");
		session.close();
		return n;
	}

	// 자원봉사 게시판 검색 글 갯수
	public static int getSearchRecordVol(HashMap num_map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("vol.searchRecord", num_map);
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
	
	// 내가 작성한 게시글 목록 출력
	public static List<MyPostVo> myPost(HashMap map) {
		SqlSession session = factory.openSession();
		List<MyPostVo> list = session.selectList("myPost.findAll", map);
		session.close();
		return list;
	}

	// 내가 작성한 전체 게시글 갯수
	public static int getTotalRecordMyPost(int member_num) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("myPost.totalRecord", member_num);
		session.close();
		return n;
	}
	
	// 내가 작성한 댓글 목록 출력
	public static List<MyReplyVo> myReply(HashMap map) {
		SqlSession session = factory.openSession();
		List<MyReplyVo> list = session.selectList("myReply.findAll", map);
		session.close();
		return list;
	}
	
	// 내가 작성한 전체 댓글 갯수
	public static int getTotalRecordMyReply(int member_num) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("myReply.totalRecord", member_num);
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
	
	public static List<MemberVo> listMember(int member_num) {
		SqlSession session = factory.openSession();
		List<MemberVo> list = session.selectList("member.findAll", member_num);
		session.close();
		return list;
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
		public static List<FindVo> mainFind(HashMap map) {
			SqlSession session = factory.openSession();
			List<FindVo> list = session.selectList("main.mainFind",map);
			session.close();
			return list;
		}
		
		// 메인에서 찾아요게시판 목록 사진 불러오기
		public static List<String> mainFindPicture(HashMap map_pic) {
			SqlSession session = factory.openSession();
			List<String> p = session.selectList("main.mainFindPicture",map_pic);
			System.out.println(p.size());
			session.close();
			return p;
		}
		
		// 메인에서 보호중게시판 조회
		public static List<BohoVo> mainBoho(HashMap map) {
			SqlSession session = factory.openSession();
			List<BohoVo> list = session.selectList("main.mainBoho",map);
			session.close();
			return list;
		}
				
		// 메인에서 보호중게시판 목록 사진 불러오기
		public static List<String> mainBohoPicture(HashMap map_pic) {
			SqlSession session = factory.openSession();
			List<String> p = session.selectList("main.mainBohoPicture",map_pic);
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
	public static PetVo detailPet(HashMap map) {
		SqlSession session = factory.openSession();
		PetVo pet = session.selectOne("pet.detailPet", map);
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
	public static int deletePet(HashMap map) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("pet.deletePet", map);
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
		
	// 보낸 쪽지 내용 상세 조회 + 해당 쪽지를 받는 사람의 닉네임
	public static NoteVo detailSendNote(int note_num) {
		SqlSession session = factory.openSession();
		NoteVo nt = session.selectOne("note.detailSendNote", note_num);
		session.close();
		return nt;
	}

	// 보낸 쪽지함에서 쪽지 선택 삭제시, 해당 쪽지의 note_send_visibility를 0으로 변경하여 보낸 쪽지함 목록에서 제외
	public static int hideSendNoteArray(int note_num) {
		SqlSession session = factory.openSession(true);
		int re = session.update("note.hideSendNoteArray", note_num);
		session.close();
		return re;
	}
	
	// 받은 쪽지함
	public static List<NoteVo> receiveNoteList(int note_receiver_num) {
		SqlSession session = factory.openSession();
		List<NoteVo> list = session.selectList("note.receiveNoteList", note_receiver_num);
		session.close();
		return list;
	}

	// 받은 쪽지 내용 상세 조회 + 해당 쪽지를 보낸(답장시 쪽지를 받을) 사람의 정보
	public static NoteVo detailReceiveNote(int note_num) {
		SqlSession session = factory.openSession();
		NoteVo nt = session.selectOne("note.detailReceiveNote", note_num);
		session.close();
		return nt;
	}
	
	// 받은 쪽지 답장
	public static int sendReplyNote(NoteVo nt) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("note.sendReplyNote", nt);
		session.close();
		return re;
	}
	
	// 새로운 쪽지 보내기
	public static int sendNewNote(NoteVo nt) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("note.sendNewNote", nt);
		session.close();
		return re;
	}
	
	// 멤버 번호를 통해 멤버 닉네임 조회
	public static String getMemberNick(int member_num) {
		SqlSession session = factory.openSession(true);
		String member_nick = session.selectOne("note.getMemberNick", member_num);
		session.close();
		return member_nick;
	}
	
	
	
	// 받은 쪽지함에서 쪽지 선택 삭제시, 받은 사람의 회원번호를 관리자 번호인 -1로 변경하여 받은 쪽지함 목록에서 제외
	public static int hideReceiveNoteArray(int note_num) {
		SqlSession session = factory.openSession(true);
		int re = session.update("note.hideReceiveNoteArray", note_num);
		session.close();
		return re;
	}

	//////////////////////////////////////// 마이페이지 끝 ////////////////////////////////////////
}