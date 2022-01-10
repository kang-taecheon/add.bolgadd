package com.bolgadd.member.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bolgadd.member.vo.memberVo;

@Repository
public class memberDAO {
	
	@Inject
	private SqlSession sqlSession;

	// 회원가입
	public int insertMember(memberVo vo) {
		return sqlSession.insert("memberMapper.insertMember", vo);
	}
	
	// 비교용 회원 조회
	public Map<String, Object> selectMember (memberVo vo) {
		return sqlSession.selectOne("memberMapper.selectMember", vo);
	}
	
	// 회원테이블 일련번호 채번(MAX + 1)
	public String selectSnMax(memberVo vo) {
		return sqlSession.selectOne("memberMapper.selectSnMax", vo);
	}
	
	// 로그인 로직 중 마지막 로그인 날짜 업데이트
	public void updateLastDt(memberVo vo) {
		sqlSession.selectOne("memberMapper.updateLastDt", vo);
	}
	
	// 회원정보 수정
	public void memberUpdate(memberVo vo) {
		sqlSession.update("memberMapper.memberUpdate", vo);
	}
}
