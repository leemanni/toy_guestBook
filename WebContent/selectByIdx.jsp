<%@page import="com.leemanni.service.SelectService"%>
<%@page import="com.leemanni.vo.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String job = request.getParameter("job");
		
		GuestbookVO vo = SelectService.getInstance().selectByIdx(idx);
		//out.println(vo);
		request.setAttribute("vo", vo);
		
		if(job.equals("update")){
			pageContext.forward("update.jsp");
		}else if(job.equals("delete")){
			pageContext.forward("delete.jsp");
		}
		
	%>
</body>
</html>