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
			$("#area1").html('아이디를 입력해주세요.').css('color','red').css('font-size','small');
			$("#id").focus();
			} 
		})
	// 비밀번호는 공백을 허용하므로 trim()을 집어넣으면 안 된다. 
	$('#pw1').focusout(function(){
		if ($('#pw1').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
			$("#pw1").focus();
			} 
		})
	$('#pwd').focusout(function(){
		if ($('#pwd').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
			} 
		})
	// 아이디 중복체크
	$('#id').focusout(function (){
		var id = $('#id').val().trim();
		$.ajax({
			url : 'checkId',
			type : 'post',
			data : {
				"id" : id
			},
			success : function(e) {
				console.log(e);
				if (e === 1) {
					$("#area1").html('동일한 아이디가 있습니다.').css('color','red').css('font-size','small');
					$('#id').val('');
					$('#id').focus();
				}
				else if (e === 0 && id != ''){
					$("#area1").html('사용가능한 아이디입니다.').css('color','green').css('font-size','small')
				}
			},
			error : function(){
				alert(`알 수 없는 에러가 발생했습니다.`);
			}
		});
	});
	$('#pw1').focusout(function(){
		checkPw()
	})
	$('#pwd').focusout(function(){
		checkPw()
	})
	// 이메일 옵션 선택
	$('#email_select').change(function(){
	    // 직접입력 선택 시,
	    if($('#email_select').val() == "2"){
	    $("#email2").val(""); //값 초기화
	    $("#email2").prop("readonly",false); 
	    } 
	   // 선택하기 선택 시,
	    else if($('#email_select').val() == "1"){
	    $("#email2").val(""); //값 초기화
	    $("#email2").prop("readonly",true); 
	    } 
	   // 옵션 안의 이메일을 선택했을 경우,
	    else {
	    $("#email2").val($('#email_select').val()); 
	    $("#email2").prop("readonly",true); 
	    }
	});
	// 이메일 옵션 중 하나 선택 후 중복체크할 경우.
	$('#email_select').focusout(function (){
		checkEmail()
	});
	// 이메일 직접입력시 중복체크
	$('#email').focusout(function (){
		checkEmail();
	});
	$('#email2').focusout(function (){
		checkEmail();
	});
})
// 비밀번호 체크 함수
function checkPw () {
	var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	var pw1 = $('#pw1').val();
	var pwd = $('#pwd').val();
	if(!reg.test(pw1)) {
		$("#area2").html('비밀번호는 숫자, 영문, 특수문자 조합으로 8자리 이상으로 입력해주세요.').css('color','red').css('font-size','small');
		$("#pw1").focus();
	}
	if (pw1 != pwd && pw1 != '' && pwd != ''){
		$("#area2").html('비밀번호가 같지 않습니다.').css('color','red').css('font-size','small');
		$("#pwd").focus();
	} else if (pw1 == pwd && pw1 != '' && pwd != '') {
		$("#area2").html('비밀번호가 동일합니다.').css('color','green').css('font-size','small')
	}
}
// 이메일 중복 체크 함수
function checkEmail(){
	var email = $('#email').val();
	var email2 = $('#email2').val();
	$.ajax({
		url : 'checkEmail',
		type : 'post',
		data : {
			"email" : email,
			"email2" : email2
		},
		success : function(e) {
			console.log(e);
			if (e === 1) {
				$("#area3").html('동일한 이메일주소가 있습니다.').css('color','red').css('font-size','small');
			}
			else if (e === 0 && email != '' && email2 != ''){
				$("#area3").html('사용가능한 이메일입니다.').css('color','green').css('font-size','small')
			}
		},
		error : function(){
			alert(`알 수 없는 에러가 발생했습니다.`);
		}
	});
};
</script>
<div id="wrap">
	<div class="content login page">
		<a href="/ro/board/main.do"><img src="/ro/img/main.png" id="goMain"></a>
		<form action="register" method="post" name ="register" enctype="multipart/form-data">
			<table>
				<tr>
					<td><h1>Register</h1></td>
				</tr>
				<tr>
					<td><input type="text" id="id" name="id" placeholder="Id" maxlength='20'></td>
				</tr>
				<tr>
					<td><div id="area1"></div></td>
				</tr>
				<tr>
					<td><input type="text" id="nickname" name="nickname" placeholder="Nickname" maxlength='8' required></td>
				</tr>
				<tr>
					<td><input type="password" id="pw1" name="pw1" placeholder="Password"></td>
				</tr>
				<tr>
					<td><input type="password" id="pwd" name="pwd" placeholder="Confirm Password"></td>
				</tr>
				<tr>
					<td class=""><div id="area2"></div></td>
				</tr>
				<tr>
					<td>
						<input type="text" id="email" size="10" placeholder="Email" name="email"/>@<input type="text" id="email2" name="email2" size="10" />
						<select id="email_select" >
							<option value="1" selected>선택하기</option>
							<option value="gmail.com" id="1">gmail.com</option>
							<option value="naver.com" id="2">naver.com</option>
							<option value="hanmail.net" id="3">hanmail.net</option>
							<option value="kakao.com" id="4">kakao.com</option>
							<option value="icloud.com" id="5">icloud.com</option>
							<option value="2">직접입력</option>
     					</select>
					</td>
				</tr>
				<tr>
					<td><div id="area3"></div></td>
				</tr>
				
				<tr>
					<td><input type="file" name="filename"></td>
				</tr>
				<tr>
					<td><h5>사진을 첨부하지 않으시면 기본이미지가 적용됩니다.</h5></td>
				</tr>
				<tr>
					<td><input type="submit" value="가입" class="Btn"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>