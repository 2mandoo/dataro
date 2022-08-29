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
<style>
#gohome {
	position: relative;
    left: 620px;
    top:20px;
    width:50px;
}
</style>
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
	$('#goMain').click(function (){
		location.href="/ro/board/main.do";
	})
});
</script>


<img src="/ro/img/main.png" id="goMain" style="position: relative; left:700px; width: 40px; top:20px; ">
<div id="wrap">
	<div class="content login bord">
		<form action="" method="get" name ="">
			<table style="width:700px;">
				<tr>
					<td id="fId"><a href="#">아이디 찾기</a></td>
					<td id="fPwd"><a href="#">비밀번호 찾기</a></td>
				</tr>
			</table>
			<div id="area"></div>
		</form>
	</div>
</div>

</body>
</html>