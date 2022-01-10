package com.bolgadd.board.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bolgadd.member.vo.memberVo;

@Repository
public class boardDAO {
	
	@Inject
	private SqlSession sqlSession;

}
