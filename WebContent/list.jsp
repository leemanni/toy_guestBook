<%@page import="com.leemanni.service.SelectService"%>
<%@page import="com.leemanni.vo.GuestbookList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List - 방명록</title>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int currentPage =1;
		try{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}catch(NumberFormatException e){;}
		
		String item = request.getParameter("item");
		String category = request.getParameter("category");
		/**
			item(검색어)  != null => 어떤한 키워드를 언급한경우
			item == null 1. 검색어를 입력하지 않은 경우 2. 프로그램을 처음 실행한 경우
			item, category => 키워드 스타일 관련하여 session 변수로 할 것
		*/
		
		if(item != null){	// 키워드를 입력한 경우 item, category 세션변수로 저장
			session.setAttribute("category", category);
			item = item.trim().length() == 0? "" : item ;
			session.setAttribute("item", item);
		}else{//검색 안한경우 , item, category 불러옴
			item = (String) session.getAttribute("item");
			category = (String) session.getAttribute("category");
		}
		
		GuestbookList guestbookList= null;
		
		if(  item== null || item.trim().length()==0 ){
			guestbookList= SelectService.getInstance().selectList(currentPage);
		}else{
			guestbookList= SelectService.getInstance().selectList(currentPage, item, category);
		}
		
		
		request.setAttribute("guestbookList", guestbookList);
		request.setAttribute("enter", "\r\n");
		
		pageContext.forward("listView.jsp");
	%>
</body>
</html>