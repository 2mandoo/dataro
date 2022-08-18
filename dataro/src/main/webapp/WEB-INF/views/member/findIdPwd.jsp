<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/ro/resources/css/login.css"/>
<link rel="stylesheet" href="/ro/resources/css/reset.css"/>
</head>
<body>
<script>
$(function(){
	$('#fId').click(function(){
		$.ajax({
			url : "findId",
			type:'get',
			success : function(e){
				$("#area").html(e);
			}
		});
	});
	$('#fPwd').click(function(){
		$.ajax({
			url : "findPwd",
			type:'get',
			success : function(e){
				$("#area").html(e);
			}
		})
	});
});
</script>

<div id="wrap">
	<div class="content login page">
		<a href="/ro/board/main.do" id="goMain"><img src="/ro/img/back.png">메인으로</a>
		<form action="" method="get" name ="">
			<table>
				<tr>
					<td id="fId">아이디 찾기</td>
					<td id="fPwd">비밀번호 찾기</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="area"></div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>
</html>