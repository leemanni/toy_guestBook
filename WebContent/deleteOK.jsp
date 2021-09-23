<%@page import="com.leemanni.service.DeleteService"%>
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
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	%>
	<jsp:useBean id="vo" class="com.leemanni.vo.GuestbookVO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>
	
	<%
		GuestbookVO original = SelectService.getInstance().selectByIdx(vo.getIdx());
		out.print("<script>");
	
		if(original.getPassword().trim().equals(vo.getPassword().trim())){
			DeleteService.getInstance().delete(vo.getIdx());
			out.println("alert('"+ vo.getIdx()+" 번글 삭제완료!')");
		}else{
			out.println("alert('비밀번호가 일치하지 않습니다')");
		}
		out.println("location.href='list.jsp?currentPage="+ currentPage+"'");
		out.print("</script>");
	%>
</body>
</html>