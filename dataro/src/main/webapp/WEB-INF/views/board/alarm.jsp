<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function (){
	hide();
	$('.checkMark').click(function(){
		$(this).find('.img1').toggle();
		$(this).find('.img2').toggle();
	});
});

function hide(){
	$('.img2').hide();
}


</script>
</head>
<body>
<div style="display:inline-block; height:200px; overflow-y:scroll;">
	<table border="1">
	<colgroup>
        <col width="130px" />
        <col width="*" />
        <col width="100px" />
    </colgroup>
		<tr>
			<td>쪽지 보낸 회원번호</td>
			<td>읽지 않은 쪽지</td>
			<td>읽음처리하기</td>
		</tr>
		<c:forEach var="li" items="${list }">
		<tr>
			<td>${li.send_member_no}</td>
			<td>${li.message_content }</td>
			<td>
				<a href="#" class="checkMark" >
					<img src="/ro/img/ok2.png" width="10px" class="img1">
					<img src="/ro/img/ok1.png" width="10px" class="img2">
				</a>
			</td>
		</tr>	
		</c:forEach>
	</table>
</div>	
<input type="button" value="읽음처리하기" style="text-align:right;">
</body>
</html>