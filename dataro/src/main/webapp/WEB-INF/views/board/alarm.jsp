<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


$(function (){

	$("#btn").click(function(){
		console.log($("#messageFrm").serialize());
		$.ajax({
 			url : '/ro/member/readProcess',
			type : 'post',
			data : $("#messageFrm").serialize(),
			success : function(e) {
				alert("읽음 처리가 완료되었습니다.");
			},
			error : function(e){
				alert(`error`);
			}
 		});
	}); 
	
	
	

});

</script>
</head>
<body>
<div style="display:inline-block; height:200px; overflow-y:scroll;">
<form id="messageFrm">
	<table>
		<colgroup>
	        <col width="100px" />
	        <col width="*" />
	        <col width="100px" />
	    </colgroup>
		<tr>
			<td>보낸 사람번호</td>
			<td>내가 받은 쪽지</td>
			<td>읽음여부</td>
		</tr>
		<tr><td>&nbsp</td></tr>
		<c:forEach var="vo" items="${list }" >
		<tr>
			<td>${vo.send_member_no}</td>
			<td>${vo.message_content}</td>
			<td><input type="checkbox" class="selected" name="message_no" value="${vo.message_no }"></td>
		</tr>
		</c:forEach>
	<tr><td>&nbsp</td></tr>
	<tr><td colspan="3"><input type="button" value="읽음처리하기" id="btn"></td></tr>
	</table>
</form>
</div>
</body>
</html>