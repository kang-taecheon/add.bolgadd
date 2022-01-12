package com.bolgadd.board.servicesImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolgadd.board.dao.boardDAO;
import com.bolgadd.board.services.boardServices;

@Service
public class boardServicesImpl implements boardServices {

	@Autowired
	private boardDAO boardDAO;
	
	// 게시물 총 갯수
	@Override
	public int countBoard(Map<String, Object> param) {
		return boardDAO.countBoard(param);
	}

	// 자유게시판 List 조회
	@Override
	public List<Map<String, Object>> selectFreeBoardList(Map<String, Object> param) {
		
		return boardDAO.selectFreeBoardList(param);
	}

	// 조회수 상승
	@Override
	public int cntUpdate(Map<String, Object> param) {
		return boardDAO.cntUpdate(param);
	}

	// 자유게시판 상세조회
	@Override
	public Map<String, Object> selectFreeBoardDetail(Map<String, Object> param) {
		return boardDAO.selectFreeBoardDetail(param);
	}



}
