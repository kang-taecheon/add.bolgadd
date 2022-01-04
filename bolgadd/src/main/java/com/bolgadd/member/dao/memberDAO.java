package com.bolgadd.member.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class memberDAO {
	
	@Inject
	private SqlSession sqlSession;

	public List<Map<String, Object>> selectTest() {
		return sqlSession.selectList("memberMapper.selectMember");
	}

}
