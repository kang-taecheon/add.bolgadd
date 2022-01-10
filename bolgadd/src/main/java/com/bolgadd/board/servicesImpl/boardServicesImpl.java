package com.bolgadd.board.servicesImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolgadd.board.services.boardServices;
import com.bolgadd.member.dao.memberDAO;

@Service
public class boardServicesImpl implements boardServices {

	@Autowired
	private memberDAO memberDAO;


}
