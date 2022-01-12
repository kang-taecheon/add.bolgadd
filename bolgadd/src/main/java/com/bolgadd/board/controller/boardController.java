package com.bolgadd.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bolgadd.board.services.boardServices;
import com.bolgadd.paging.pagingVo;

/**
 * 게시판 관련 컨트롤러
 */
@Controller
public class boardController {
	
	@Autowired
	private boardServices boardServices;
	
	// 자유게시판 조회
	@RequestMapping("/board/boardList")
	@ResponseBody
	public ModelAndView selectFreeBoardList(@RequestParam Map<String, Object> param, HttpSession session,
			pagingVo vo, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		ModelAndView mav = new  ModelAndView("jsonView");
		
		int total = boardServices.countBoard(param);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new pagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<Map<String, Object>> listMap = boardServices.selectFreeBoardList(param);

		mav.setViewName("/board/boardList");
		
		mav.addObject("paging", vo);
		mav.addObject("list", listMap);
		
		return mav;
	}
	
	// 자유게시판 상세조회
	@RequestMapping("/board/boardDetail")
	@ResponseBody
	public ModelAndView selectFreeBoardDetail(@RequestParam Map<String, Object> param, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.setViewName("/board/boardDetail");
		
		// 조회수 상승 쿼리
		param.put("userId", (String)session.getAttribute("tcId"));
		int cntUp = boardServices.cntUpdate(param);
		
		Map<String, Object> map = boardServices.selectFreeBoardDetail(param);
		
		mav.addObject("map", map);
		return mav;
	}
}
