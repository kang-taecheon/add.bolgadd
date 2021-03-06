package com.bolgadd.member.servicesImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolgadd.member.dao.memberDAO;
import com.bolgadd.member.services.memberServices;
import com.bolgadd.member.vo.memberVo;

@Service
public class memberServicesImpl implements memberServices {

	@Autowired
	private memberDAO memberDAO;

	// 회원가입
	@Override
	public int insertMember(memberVo vo) {
		return memberDAO.insertMember(vo);
	}
	
	// 비교용 회원 조회
	@Override
	public Map<String, Object> selectMember (memberVo vo) {
		return memberDAO.selectMember(vo);
	}

	// 회원테이블 일련번호 채번(MAX + 1)
	@Override
	public String selectSnMax(memberVo vo) {
		return memberDAO.selectSnMax(vo);
	}

	// 로그인 로직 중 마지막 로그인 날짜 업데이트
	@Override
	public void updateLastDt(memberVo vo) {
		memberDAO.updateLastDt(vo);
	}

	// 회원정보 수정
	@Override
	public void memberUpdate(memberVo vo) {
		memberDAO.memberUpdate(vo);
	}

}
