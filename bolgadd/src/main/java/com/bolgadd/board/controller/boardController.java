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

import com.bolgadd.board.dao.boardDAO;
import com.bolgadd.board.services.boardServices;
import com.bolgadd.board.vo.PageVo;

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
			@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new  ModelAndView("jsonView");

		int count = boardServices.countBoard(param); // 페이징에 필요한 count조회
		
		// 페이징 관련 시작
    	PageVo pv = new PageVo(count, curPage);
    	int start = pv.getPageBegin();
    	int end = pv.getPageEnd();
    	param.put("start", start);
    	param.put("end", end);
    	mav.addObject("pv", pv); // 페이징 정보
    	// 페이징 관련 끝
		
		List<Map<String, Object>> listMap = boardServices.selectFreeBoardList(param);
		
		mav.setViewName("/board/boardList");
		
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
