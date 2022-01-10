package com.bolgadd.member.services;

import java.util.List;
import java.util.Map;

import com.bolgadd.member.vo.memberVo;

public interface memberServices {

	// 회원가입
	public int insertMember(memberVo vo);
	
	// 비교용 회원 조회
	public Map<String, Object> selectMember(memberVo vo);
	
	// 회원테이블 일련번호 채번(MAX + 1)
	public String selectSnMax(memberVo vo);

}
