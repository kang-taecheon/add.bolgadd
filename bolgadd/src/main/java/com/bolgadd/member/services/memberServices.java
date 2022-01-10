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
	
	// 로그인 로직 중 마지막 로그인 날짜 업데이트
	public void updateLastDt(memberVo vo);

	// 회원정보 수정
	public void memberUpdate(memberVo vo);
}
