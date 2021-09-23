package com.leemanni.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.leemanni.vo.GuestbookVO;
import com.leemanni.vo.Params;

public class GuestbookDAO {
	private static GuestbookDAO instance = new GuestbookDAO();
	private GuestbookDAO() {;}
	public static GuestbookDAO getInstance() {
		return instance;
	}
	public void insert(SqlMapClient mapper, GuestbookVO vo) throws SQLException {
		System.out.println("GuestbookDAO 클레스 insert() 메소드 실행!!");
		//System.out.println("GuestbookDAO mapper=>  " + mapper);
		//System.out.println("GuestbookDAO vo=>  " + vo);
		
//		insert("실행할 sql 명령의 id" , "[sql 명령으로 전달할 데이터]");
		mapper.insert("insert",vo ); // 첫번째 인수 id, 두번째 인수가 data
		
		//throws => 예외 미루기, 즉 발생한 곳이 아닌 호출한 곳에서 오류를 처리하는것 but 누군간 처리해야함
		//try-catch => 오류가 발생한 곳에서 처리하는 것
		
	}
	public int selectCount(SqlMapClient mapper) throws SQLException {
		System.out.println("GuestbookDAO ==> selectCount()");
		return (int) mapper.queryForObject("selectCount");
	}
	
	// sleectService 클래스에서 mapper 와 1페이즈 시작~끝 글번호를 기억한 hashmap 을 인수로 받아서
	// 글번호 찯는 sql 문 실행
	public ArrayList<GuestbookVO> selectList(SqlMapClient mapper, HashMap<String, Integer> hmap) throws SQLException {
		System.out.println("GuestbookDAO ==> selectList(mapper)");
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectList", hmap);
	}
	
	
	
	public int selectCount(SqlMapClient mapper, Params param) throws SQLException {
		System.out.println("GuestbookDAO ==> selectCount(mapper, params)");
		return (int) mapper.queryForObject("selectCount_params", param);
	}
	public ArrayList<GuestbookVO> selectList(SqlMapClient mapper, Params param) throws SQLException {
		System.out.println("GuestbookDAO ==> selectList(mapper, param)");
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectList_params", param);
	}
	
	// 수정 또는 삭제 명령을 받은 idx 를 데려오는 메소드
	public GuestbookVO selectByIdx( SqlMapClient mapper, int idx) throws SQLException {
		System.out.println("GuestbookDAO ==> selectByIdx(idx)");
		
		return (GuestbookVO) mapper.queryForObject("selectByIdx", idx);
	}
	public void delete(SqlMapClient mapper, int idx) throws SQLException {
		System.out.println("GuestbookDAO ==> delete(idx)");
		mapper.delete("delete", idx);
	}
	public void update(SqlMapClient mapper, GuestbookVO vo) throws SQLException {
		System.out.println("GuestbookDAO ==> update(idx)");
		mapper.update("update" , vo);
	}
	
	
	
	
	
}
