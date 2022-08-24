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
	$('#id').focusout(function(){
		if ($('#id').val().trim() === '' ){
			$("#area1").html('닉네임을 입력해주세요.').css('color','red').css('font-size','small');
			$('#id').focus();
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
	$('#findPwd').click(function(){
		$.ajax({
			url:'findPwd',
			method : 'post',
			data: {
				id : $("#id").val(),
				email : $("#email").val()
			},
			success : function(res) {
				if (res.trim() == '') {
					alert('회원정보가 올바르지 않습니다.');
				} else {
					alert('임시비밀번호가 이메일로 발송되었습니다.');
				}
			}
		});
	});
});
</script>
<div id="wrap">
	<div class="content login ">
		<form action="" method="post" name ="" >
			<table>
				<tr><td><h1>비밀번호 찾기</h1></td></tr>
				<tr>
					<td><input type="text" id="id" name="id" placeholder="Id" ></td>
				</tr>
				<tr>
					<td><div id="area1"></div></td>
				</tr>
				<tr>
					<td><input type="text" id="email" name="email" placeholder="Email" maxlength='40'></td>
				</tr>
				<tr>
					<td><div id="area2"></div></td>
				</tr>
				<tr>
					<td><input class="Btn" type="button" value="비밀번호 찾기" id="findPwd"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>