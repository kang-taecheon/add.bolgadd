package com.bolgadd.member.servicesImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolgadd.member.dao.memberDAO;
import com.bolgadd.member.services.memberServices;

@Service
public class memberServicesImpl implements memberServices {

	@Autowired
	private memberDAO testDAO;
	
	@Override
	public List<Map<String, Object>> selectTest() {
		return testDAO.selectTest();
	}

}
