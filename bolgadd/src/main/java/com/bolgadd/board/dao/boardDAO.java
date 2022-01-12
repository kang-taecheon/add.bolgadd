package com.bolgadd.board.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class boardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 개시물 총 갯수
	public int countBoard(Map<String, Object> param) {
		return sqlSession.selectOne("boardMapper.countBoard", param);
	}
	
	// 자유게시판 List 조회
	public List<Map<String, Object>> selectFreeBoardList(Map<String, Object> param) {
		return sqlSession.selectList("boardMapper.selectFreeBoardList", param);
	}
	
	// 조회수 상승
	public int cntUpdate(Map<String, Object> param) {
		return sqlSession.update("boardMapper.cntUpdate", param);
	}
	
	// 자유게시판 상세조회
	public Map<String, Object> selectFreeBoardDetail(Map<String, Object> param) {
		return sqlSession.selectOne("boardMapper.selectFreeBoardDetail", param);
	}

}
