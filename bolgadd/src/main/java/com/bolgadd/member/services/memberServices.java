package com.bolgadd.member.services;

import java.util.List;
import java.util.Map;

import com.bolgadd.member.vo.memberVo;

public interface memberServices {

	// 회원가입
	public int insertMember(memberVo vo);
	
	// 비교용 회원 조회
	public Map<String, Object> selectMember(memberVo vo);

}
