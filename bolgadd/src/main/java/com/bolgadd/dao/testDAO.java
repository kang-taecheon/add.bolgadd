package com.bolgadd.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class testDAO {
	
	@Inject
	private SqlSession sqlSession;

	public List<Map<String, Object>> selectTest() {
		System.out.println(">>>>> DAO 진입");
		return sqlSession.selectList("testMapper.selectTest");
	}

}
