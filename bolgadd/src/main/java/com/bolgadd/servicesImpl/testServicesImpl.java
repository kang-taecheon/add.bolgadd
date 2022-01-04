package com.bolgadd.servicesImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolgadd.dao.testDAO;
import com.bolgadd.services.testServices;

@Service
public class testServicesImpl implements testServices {

	@Autowired
	private testDAO testDAO;
	
	@Override
	public List<Map<String, Object>> selectTest() {
		System.out.println(">>>>> 서비스 임플 진입");
		return testDAO.selectTest();
	}

}
