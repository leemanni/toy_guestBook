<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="insertOK.jsp">
		<table width="800" align="center" border="3" cellpadding="4" cellspacing="0">
			<tr>
				<th colspan="2">
					방명록 쓰기
				</th>
			</tr>
			<tr>
				<td width="200">
					이름
				</td>
				<td width="600">
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td width="200">
					비밀번호
				</td>
				<td width="600">
					<input type="password" name="password" >
				</td>
			</tr>
			<tr>
				<td width="200">
					메모
				</td>
				<td width="600">
					<textarea rows="5" cols="65" name="memo" style="resize: none;"></textarea>
				</td>
			</tr>
			<tr>
			<td colspan="2">
					<input type="submit" value="글 남기기"/>
					<input type="reset" value="초기화"/>
					<input type="button" value="돌아가기" onclick="history().back()"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
	</form>
</body>
</html>