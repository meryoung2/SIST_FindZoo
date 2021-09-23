package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;


import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.PetVo;

@Repository
public class PetDao {

	// 마이페이지에 반려동물 이름 리스트 출력
	public List<PetVo> listPet(int member_num) {
		return DBManager.listPet(member_num);
	}
	
	// 마이페이지 반려동물 정보 상세 조회 
	public PetVo detailPet(HashMap map) {
		return DBManager.detailPet(map);
	}
	
	// 마이페이지 반려동물 추가
	public int insertPet(PetVo pet) {
		return DBManager.insertPet(pet);
	}
	
	// 마이페이지 반려동물 삭제
	public int deletePet(HashMap map) {
		return DBManager.deletePet(map);
	}
	
}