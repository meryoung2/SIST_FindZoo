package com.example.demo.dao;

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
	public PetVo detailPet(int pet_num) {
		return DBManager.detailPet(pet_num);
	}
	
	// 마이페이지 반려동물 추가
	public int insertPet(PetVo pet) {
		return DBManager.insertPet(pet);
	}
	
	// 마이페이지 반려동물 삭제
	public int deletePet(int pet_num) {
		return DBManager.deletePet(pet_num);
	}
	
}