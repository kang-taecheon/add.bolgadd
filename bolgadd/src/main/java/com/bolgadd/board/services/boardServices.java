package com.bolgadd.board.services;

import java.util.List;
import java.util.Map;

public interface boardServices {
	
	// 게시물 총 갯수
	public int countBoard(Map<String, Object> param);
	
	// 자유게시판 List 조회
	public List<Map<String, Object>> selectFreeBoardList(Map<String, Object> param);
	
	// 조회수 상승
	public int cntUpdate(Map<String, Object> param);
	
	// 자유게시판 상세조회
	public Map<String, Object> selectFreeBoardDetail(Map<String, Object> param);

}
