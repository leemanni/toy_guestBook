package com.leemanni.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.leemanni.dao.GuestbookDAO;
import com.leemanni.ibatis.MyAppSqlConfig;

public class DeleteService {
	private static DeleteService instance = new DeleteService();
	private DeleteService() {;}
	public static DeleteService getInstance() {
		return instance;
	}
	public void delete(int idx) {
		System.out.println("DeleteService ==> delete()");
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		try {
			GuestbookDAO.getInstance().delete(mapper, idx);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
