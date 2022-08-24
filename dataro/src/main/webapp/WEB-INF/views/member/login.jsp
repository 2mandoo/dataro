<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ro/resources/css/reset.css"/>
<link rel="stylesheet" href="/ro/resources/css/login.css"/>
</head>
<body>
<script>
$(function(){
	$('#id').focusout(function(){
		if ($('#id').val().trim() === '' ){
			$("#area1").html('아이디를 입력해주세요.').css('color','red').css('font-size','small');
			$('#id').focus();
			} else {
				$("#area1").hide();
			} 
	});
	$('#pwd').focusout(function(){
		if ($('#pwd').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
			$('#pwd').focus();
			} else {
				$("#area2").hide();
			} 
	});
	
	
});


</script>
<div id="wrap">
	<div class="content login page">
		<form action="login" method="post" name ="login">
		<a href="/ro/board/main.do"><img src="/ro/img/main.png" id="goMain"></a>
		<table>
			<tr><th><h1>DataRo</h1></th></tr>
			<tr>
				<td><input type="text" id="id" name="id" placeholder="Id"></td>
			</tr>
			<tr>
				<td><div id="area1"></div></td>
			</tr>
			<tr>
				<td><input type="password" id="pwd" name="pwd" placeholder="Password"></td>
			</tr>
			<tr>
				<td><div id="area2"></div></td>
			</tr>
			<tr>
				<td><input type="submit" value="login" class="Btn"></td>
			</tr>
			<tr>
				<td><h5 style="padding-top: 20px;">---------------- 또는 ----------------</h5></td>
			</tr>
			<tr>
				<td><a href="/ro/member/findIdPwd"><h4><b><u>아이디 혹은 비밀번호를 잊으셨나요?</u></b></h4></a></td>
			</tr>
			<tr>
				<td><h3>회원이 아니신가요?<a href="/ro/member/register" style="color:blue">&nbsp가입하기</h3></a></td>
			</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>