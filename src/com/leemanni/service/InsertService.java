package com.leemanni.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.leemanni.dao.GuestbookDAO;
import com.leemanni.ibatis.MyAppSqlConfig;
import com.leemanni.vo.GuestbookVO;

public class InsertService {
	private static InsertService instance = new InsertService();
	
	private InsertService() {}
	
	public static InsertService getInstance() {
		return instance;
	}
	
	public void insert(GuestbookVO vo) {
		System.out.println("InsertSrvice 클레스 insert() 메소드 실행");
		
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
//		System.out.println(mapper);
		
		try {
			GuestbookDAO.getInstance().insert(mapper, vo);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	}
	
}
