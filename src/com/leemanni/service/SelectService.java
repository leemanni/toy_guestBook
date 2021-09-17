package com.leemanni.service;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.leemanni.dao.GuestbookDAO;
import com.leemanni.ibatis.MyAppSqlConfig;
import com.leemanni.vo.GuestbookList;
import com.leemanni.vo.GuestbookVO;
import com.leemanni.vo.Params;

/**
 * 
 * @author leemanni
 * list.jsp 에서 호출괴는 페이지 번호 넘겨받아서 mapper 만들 고 DAO 클래스의 1페이지 분량 글 얻어오는 select sql 문 실행해주는 클래스
 *
 */
public class SelectService {
	private static SelectService instance = new SelectService();
	private SelectService() {;}
	public static SelectService getInstance() {
		return instance;
	}
	
	
	// 전체 글을 불러오는 메소드
	public GuestbookList selectList(int currentPage) {
		System.out.println("SelectService ===> selectList()");
		GuestbookList guestbookList = null;
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		//DAO 두번 쓸 예정이라 객체를 미리 얻어옴
		GuestbookDAO dao = GuestbookDAO.getInstance();
		try {
			int pageSize = 5;
			int totalCount = dao.selectCount(mapper);
			
			guestbookList = new GuestbookList(pageSize, totalCount, currentPage);
			
			HashMap<String, Integer> hmap = new HashMap<>();
			hmap.put("startNo" , guestbookList.getStartNo());
			hmap.put("endNo" , guestbookList.getEndNo());
			
			guestbookList.setList(dao.selectList(mapper, hmap));
			
		}catch (SQLException e) {
		}
		
		return guestbookList;
	}
	// 선택된 검색어를 불러와 주기를 DAO 에 요청하는 메소드
	public GuestbookList selectList(int currentPage , String item, String category) {
		System.out.println("SelectService ===> selectList(currentPage, item, category)");
		GuestbookList guestbookList =  null;
		GuestbookDAO dao = GuestbookDAO.getInstance();
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		try {
			int pageSize = 5;
			Params params = new Params();
			params.setCategory(category);
			params.setItem(item);
			int totalCount = dao.selectCount(mapper , params);
//			System.out.println(totalCount);
			
			guestbookList = new GuestbookList(pageSize, totalCount, currentPage);
			params.setStartNo(guestbookList.getStartNo());
			params.setEndNo(guestbookList.getEndNo());
			guestbookList.setList(dao.selectList(mapper, params));
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return guestbookList;
	}
	
	public GuestbookVO selectByIdx(int idx) {
		System.out.println("SelectService ===> selectByIdx(idx)");
		GuestbookVO vo = null;
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
		try {
			vo = GuestbookDAO.getInstance().selectByIdx( mapper, idx);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	
	
	
}
