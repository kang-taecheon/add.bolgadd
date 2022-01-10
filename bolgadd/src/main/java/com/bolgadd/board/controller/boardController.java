package com.bolgadd.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bolgadd.board.services.boardServices;

/**
 * 회원 관련 컨트롤러
 */
@Controller
public class boardController {
	
	@Autowired
	private boardServices boardServices;
	
	// 회원가입 페이지 GET
	@RequestMapping("/board/boardList")
	public String registerPage () {
		return "/board/boardList";
	}

}
