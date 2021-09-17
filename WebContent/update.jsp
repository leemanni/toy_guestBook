<%@page import="com.leemanni.vo.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- jstl 을 이용해 대입문, 제어문, 서식, 함수를 사용하려면  아래의 내용을 코딩한다. 나중에 복사해서 쓰렴. -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		<!-- 대입문, 제어문 -->
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- 서식 -->
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 	<!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>
	<%
		GuestbookVO vo = (GuestbookVO)request.getAttribute("vo");
		out.println(vo);
	%>
</body>
</html>