package com.bolgadd.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bolgadd.member.services.memberServices;
import com.bolgadd.member.vo.memberVo;

/**
 * 회원 관련 컨트롤러
 */
@Controller
public class memberController {
	
	@Autowired
	private memberServices memberServices;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	// 회원가입 페이지 GET
	@RequestMapping("/member/register")
	public String registerPage () {
		return "/member/register";
	}

	// 회원가입 페이지 POST
	@RequestMapping("/member/insertMember")
	@ResponseBody
	public String insertMember (memberVo vo) {
		
		// 아이디 중복 확인용 조회
		Map<String, Object> map = memberServices.selectMember(vo);
		
		if (map != null) { // 중복된 아이디가 존재할 때
			return "equals";
		}else { // 중복된 아이디가 없을 때
			String encPassword = passwordEncoder.encode(vo.getTcPw()); // 비밀번호 암호화
			vo.setTcPw(encPassword); // 암호화된 비밀번호 vo에 넣기

			// 회원테이블 일련번호 채번(MAX + 1)
			String sn = memberServices.selectSnMax(vo);
			vo.setTcSn(sn);
			
			int result = memberServices.insertMember(vo); // 회원가입 insert
			return "notEquals";
		}
		
	}
	
	// 로그인 페이지 GET
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login () {
		return "/member/login";
	}
	
	// 로그인 페이지 POST
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	@ResponseBody
	public String loginPost (memberVo vo, HttpSession session) {
		
		Map<String, Object> map = memberServices.selectMember(vo);
		
		if (map != null) { // 회원 정보가 있음. 로그인 처리

			// 패스워드 비교하여 일치했을 때에만 로그인 되도록
			String encPassword = map.get("TC_PW").toString();

			if (passwordEncoder.matches(vo.getTcPw(), encPassword)) { // DB에 저장된 암호화된 비밀번호와 입력한 비밀번호를 비교하는 함수
				session.setAttribute("tcId", map.get("TC_ID"));
				session.setAttribute("tcNm", map.get("TC_NM"));
				session.setAttribute("tcSn", map.get("TC_SN"));
				session.setAttribute("tcRyt", map.get("TC_RYT"));
				
				return "login";
			}else {
				session.invalidate(); //세션의 모든 속성을 삭제
				
				return "pwNotEquals";
			}
			
		}else { // 회원 정보가 없음. 다시 로그인 페이지로 이동
			session.invalidate(); //세션의 모든 속성을 삭제
			
			return "noMember";
		}
	}
	
	// 로그아웃 POST
	@RequestMapping(value="/member/logout", method=RequestMethod.POST)
	@ResponseBody
	public String logoutPost (HttpSession session) {
		session.invalidate();
		return "logout";
	}
	
	// 회원정보 수정
	@RequestMapping(value="/member/memberUpdate")
	public ModelAndView view(@ModelAttribute memberVo vo, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberUpdate");
		
		String id = (String)session.getAttribute("tcId"); //리턴 타입은 Object
		
		vo.setTcId(id);
		
		Map<String, Object> map = memberServices.selectMember(vo);
		
		mav.addObject("outVo", map);
		
		return mav;
	}
}
