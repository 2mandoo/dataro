<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ro/resources/css/login.css"/>
<link rel="stylesheet" href="/ro/resources/css/reset.css"/>
</head>
<body>
<script>
$(function(){
	$('#nickname').focusout(function(){
		if ($('#nickname').val().trim() === '' ){
			$("#area1").html('닉네임을 입력해주세요.').css('color','red').css('font-size','small');
			$('#nickname').focus();
			} else {
				$("#area1").hide();
			} 
		});
	$('#email').focusout(function(){
		if ($('#email').val() === '' ){
			$("#area2").html('이메일을 입력해 주세요.').css('color','red').css('font-size','small');
			$('#email').focus();
			} else {
				$("#area2").hide();
			} 
		})
	$('#findId').click(function(){
		$.ajax({
			url:'findId',
			method : 'post',
			data: {
				email : $("#email").val(),
				nickname : $("#nickname").val()
			},
			success : function(res) {
				if (res.trim() == '') {
					alert('입력하신 정보는 존재하지 않습니다.');
				} else {
					alert('아이디는 "'+res.trim()+'" 입니다.');
				}
			}
		});
	});
});
</script>
<div id="wrap">
	<div class="content login">
		<form action="" method="post" name ="">
		<h1>아이디 찾기</h1>
			<table>
				<tr>
					<td><input type="text" id="nickname" name="nickname" placeholder="nickname" maxlength='5'></td>
				</tr>
				<tr>
					<td><div id="area1"></div></td>
				</tr>
				<tr>
					<td><input type="text" id="email" name="email" placeholder="email" maxlength='20'></td>
				</tr>
				<tr>
					<td><div id="area2"></div></td>
				</tr>
				
				<tr>
					<td><input type="button" class="Btn" value="아이디 찾기" id="findId"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>