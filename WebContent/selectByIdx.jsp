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
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String job = request.getParameter("job");
		
		GuestbookVO vo = SelectService.getInstance().selectByIdx(idx);
		//out.println(vo);
		request.setAttribute("vo", vo);
		
		if(vo== null){
			out.println("<script>");
			out.println("alert(' "+idx+" 번 글이 테이블에 존재하지 않습니다.')");
			out.println("location.href='list.jsp'");
			out.println("</script>");
		}else{
			request.setAttribute("vo", vo);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("enter", "\r\n");
			pageContext.forward(job+".jsp");
		}
	%>
</body>
</html>