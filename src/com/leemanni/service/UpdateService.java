package com.leemanni.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.leemanni.dao.GuestbookDAO;
import com.leemanni.ibatis.MyAppSqlConfig;
import com.leemanni.vo.GuestbookVO;

public class UpdateService {
	private static UpdateService instance = new UpdateService();
	private UpdateService() {;}
	public static UpdateService getInstance() {
		return instance;
	}
	public void update(GuestbookVO vo) {
		System.out.println("UpdateService 클래스에서 update 메소드");
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		try {
			GuestbookDAO.getInstance().update(mapper, vo);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
