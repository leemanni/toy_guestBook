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
<title>delete</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>
	<form action="deleteOK.jsp">
		<table width="600" align="center" border="1" cellpadding="3" cellspacing="0">
			<tr>
				<td colspan="2"> 
					삭제할 글 보기
				</td>
			</tr>
			<tr>
				<td width="100">
					이름					
				</td>
				<td width="500">
					<c:set var="name" value="${fn:replace(vo.name,'<','&lt')}"/>
					<c:set var="name" value="${fn:replace(name,'>','&gt')}"/>
					${name}
				</td>
			</tr>
			<tr>
				<td>
					작성일
				</td>
				<td>
					<fmt:formatDate value="${vo.writeDate}" pattern="yyyy년 MM월 dd일 E요일  (HH:mm:ss)"/>
				</td>
			</tr>
			<tr>
				<td>
					메모
				</td>
				<td>
				 	<c:set var="memo" value="${fn:replace(vo.memo,'<','&lt')}"/>
					<c:set var="memo" value="${fn:replace(memo,'>','&gt')}"/>
					<c:set var="memo" value="${fn:replace(memo,enter,'<br/>')}"/>
					${memo }
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label>비밀번호
						<input type="password" name="password"/>
					</label>
					<input type="submit" value="삭제하기"/>
					<input type="button" value="다시쓰기"/>
					<input type="button" value="돌아기기" onclick="history.back()"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="idx" value="${vo.idx}">
		<input type="hidden" name="currentPage" value="${currentPage}">
	</form>
</body>
</html>