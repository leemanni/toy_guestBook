<%@page import="com.leemanni.vo.GuestbookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.leemanni.vo.GuestbookList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- jstl 을 이용해 대입문, 제어문, 서식, 함수를 사용하려면  아래의 내용을 코딩한다. 나중에 복사해서 쓰렴. -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		<!-- 대입문, 제어문 -->
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- 서식 -->
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 	<!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	span {
	color: teal;
	font-size: 20px;
	font-weight: 600;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>
	 <c:set var="view" value="${guestbookList.list}"/>
	 <table width="1000" border="3" align="center" cellpadding="5" cellspacing="0">
		<tr>
			<th> 방명록 보기
			</th>
		</tr>
		<tr>
			<td align="right">
				전체 글 수 : ${guestbookList.totalCount} 개 (현재 페이지  : ${guestbookList.currentPage} / ${guestbookList.totalPage} page)
			</td>
		</tr>
		<tr>
			<td>
				<c:if test="${view.size() ==0 }">
					<marquee>저장된 글이 없습니다.</marquee>
				</c:if>
				<c:if test="${view.size() !=0 }">
					<jsp:useBean id="date" class="java.util.Date"/>
						<c:forEach var="vo" items="${view}">
							<table width="98%" border="3" align="center" cellpadding="5" cellspacing="0">		
							<tr>
								<td>
									${vo.idx}.
									<c:set var="name" value="${fn:replace(vo.name,'<','&lt')}"/>
									<c:set var="name" value="${fn:replace(name,'>','&gt')}"/>
									<c:if test="${category == '이름' || category=='내용+이름'}">
										<c:set var="search" value="<span>${item}</spam>"/>
										${fn:replace(name, item, search)}
									</c:if>
									<c:if test="${category == null || category=='내용'}">
										${name} 
									</c:if>
									님(${vo.ip})이
									<!-- 오늘 입력한 글은 시간만 어제 이전에 입력한 글은 날짜만 나오게 한다. -->
									<c:if test="${date.year ==vo.writeDate.year && vo.writeDate.month == date.month}">
										<fmt:formatDate value="${vo.writeDate}" pattern="HH:mm"/>
									</c:if>
									<c:if test="${date.year !=vo.writeDate.year || vo.writeDate.month != date.month}">
										<fmt:formatDate value="${vo.writeDate}" pattern="yyyy/MM/dd(E)"/>
									</c:if>
									에 남긴글 
									 <c:set var="memo" value="${fn:replace(vo.memo,'<','&lt')}"/>
									 <c:set var="memo" value="${fn:replace(memo,'>','&gt')}"/>
									 <c:set var="memo" value="${fn:replace(memo,enter,'<br/>')}"/>
									 <!-- 수정, 삭제 버튼 추가 -->
									 <input type="button" value="수정"
									  onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${guestbookList.currentPage}&job=update'">
									 <input type="button" value="삭제"
									  onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${guestbookList.currentPage}&job=delete'">
									<br/>
									<c:if test="${category == '내용' || category=='내용+이름'}">
										<c:set var="search" value="<span>${item}</spam>"/>
											${fn:replace(memo, item, search)}
									</c:if>
									<c:if test="${category == null || category=='이름'}">
										${memo} 
									</c:if>
									
									${memo}
								</td>
							</tr>
						</table>
						<hr/>
						</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<td align="center">
			<!-- 처음으로 -->
				<c:if test="${guestbookList.currentPage > 1}">
					<button class="button button1" type="button" title="첫 페이지로" onclick="location.href='?currentPage=1'">처음</button>
				</c:if>
				
				<c:if test="${guestbookList.currentPage <= 1}">
					<button class="button button2" type="button" title="이미 첫 페이지입니다." disabled="disabled">처음</button>
				</c:if>
			<!-- 10페이지 앞으로 -->
				<c:if test="${guestbookList.startPage > 1}">
					<button class="button button1" type="button" title="이전 10페이지로" 
					onclick="location.href='?currentPage=${guestbookList.startPage - 1}'">이전</button>
				</c:if>
				<c:if test="${guestbookList.startPage <= 1}">
					<button class="button button2" type="button" title="이미 첫 10 페이지입니다." disabled="disabled">이전</button>
				</c:if>
				
				
				<c:forEach var="i" begin="${guestbookList.startPage}" end="${guestbookList.endPage}" step="1">
				
					<c:if test="${guestbookList.currentPage == i}">
						<button class="button button2" type="button" disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${guestbookList.currentPage != i}">
						<button class="button button1" type="button" onclick="location.href='?currentPage=${i}'">${i}</button>
					</c:if>
				</c:forEach>
				
				
			<!-- 10페이지 뒤로 -->
				<c:if test="${guestbookList.currentPage < guestbookList.totalPage}">
					<button class="button button1" type="button" title="다음 10페이지로" 
					onclick="location.href='?currentPage=${guestbookList.endPage +1}'">다음</button>
				</c:if>
				<c:if test="${guestbookList.currentPage >= guestbookList.totalPage}">
					<button class="button button2" type="button" title="이미 마지막 페이지입니다." disabled="disabled">다음</button>
				</c:if>
				
			<!-- 맨뒤로 -->
				<c:if test="${guestbookList.currentPage < guestbookList.totalPage}">
					<button class="button button1" type="button" title="마지막 페이지로" 
					onclick="location.href='?currentPage=${guestbookList.totalPage}'">마지막</button>
				</c:if>
				<c:if test="${guestbookList.currentPage >= guestbookList.totalPage}">
					<button class="button button2" type="button" title="이미 마지막 페이지입니다." disabled="disabled">맨뒤</button>
				</c:if>
			</td>
		</tr>
		<!-- 카테코리별 검색어를 입력받는다 -->
		<tr>
			<td align="center">
				<form action="list.jsp" method="post">
					<select name="category">
						<option>내용</option>
						<option>이름</option>
						<option>내용+이름</option>
					</select>
					<input type="text" name="item"/>
					<input type="submit" value="검색"/>
					
				</form>
			</td>
		</tr>
		
		
		
		<!-- 글쓰기 버튼 -->
		<tr>
			<td align="right">
				<input type="button" value="글쓰기" onclick="location.href='insert.jsp'"/>
			</td>
		</tr>
		
		
		
	</table>
</body>
</html>