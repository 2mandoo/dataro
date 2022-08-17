<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<colgroup>
        <col width="100px" />
        <col width="*" />
        <col width="100px" />
    </colgroup>
	<tr>
		<td>보낸 사람번호</td>
		<td>내가 받은 쪽지</td>
	</tr>
<c:forEach var="vo" items="${list }" >
	<tr>
		<td>${vo.send_member_no}</td>
		<td>${vo.message_content}</td>
		<td>
			<a>
				<img src="/ro/img/unread.png" width="10px">
			</a>
		</td>
	</tr>
	
</c:forEach>
	
</table>
</body>
</html>