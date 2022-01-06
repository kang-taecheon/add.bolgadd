package com.bolgadd.member.dao;

import java.util.List;
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
}
