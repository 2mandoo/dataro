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
	// 비밀번호입력칸
	$('#pw1').focusout(function(){
		if ($('#pw1').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
			$("#pw1").focus();
			} 
		})
	// 비밀번호확인칸
	$('#pwd').focusout(function(){
		if ($('#pwd').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
			$("#pwd").focus();
			} 
		})
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
	//탈퇴버튼 누르고 모달띄우기
	$('#btn_leave').click(function(){
		$('.modal').fadeIn();
	});
	$('.btn-close').click(function(){
		$('.modal').fadeOut();
	});
	
});

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
				$("#area3").html('동일한 이메일주소가 있습니다.').css('color','red').css('font-size','small')
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
		<form action="editUserInfo" method="post" name ="register" enctype="multipart/form-data">
			<table >
				<tr>
					<td></td>
					<td colspan="2"><h1>회원정보수정</h1></td>
				</tr>
				<tr>
					<td class="right">아이디 : &nbsp</td>
					<td><input type="text" id="id" name="id" value="${loginInfo.id }" readonly></td>
				</tr>
				<tr>
					<td class="right">닉네임 : &nbsp</td>
					<td><input type="text" id="nickname" name="nickname" placeholder="nickname"></td>
				</tr>
				<tr>
					<td class="right">비밀번호 : &nbsp</td>
					<td><input type="text" id="pw1" name="pw1" placeholder="pw"></td>
				</tr>
				<tr>
					<td class="right">비밀번호 확인 : &nbsp</td>
					<td><input type="text" id="pwd" name="pwd" placeholder="pw for confirmation"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4"><div id="area2"></div></td>
				</tr>
				<tr>
					<td class="right">이메일 :</td>
					<td colspan="3" style="text-align:left;">
						<input type="text" id="email" size="10" placeholder="email" name="email"/>@<input type="text" id="email2" name="email2" size="10" />
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
					<td colspan="4"><div id="area3"></div></td>
				</tr>
				<tr>
					<td class="right">내 사진변경 : &nbsp</td>
					<td colspan=""><input type="file" name="filename"></td>
				</tr>
				<tr>
					<td colspan="4" ><h5>사진을 첨부하지 않으시면 기본이미지가 적용됩니다.</h5></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" value="수정하기" class="Btn"></td>
				</tr>
				<tr><td>&nbsp</td></tr>
				<tr>
					<td class="right"><a href="/ro/board/main.do" >메인으로</a></td>
					<td><input type="button" id="btn_leave" value="탈퇴하기"></td>
				</tr>
			</table>
		</form>
		<form action="leave" method="post">
			<div class="modal">
				<div class="modal-content">
					<a class="btn-close" href="#none">X</a>
					<h1>회원탈퇴</h1>
					${loginInfo.nickname } 님, 안녕하세요! <br>
					계정을 삭제하려고 하신다니 아쉽습니다. <br>
					<br><img src="/ro/img/sadCat.jpg" style="width:200px; display:block; position:relative; left:70px;"/><br>
					회원 탈퇴를 원하시면 비밀번호를 입력해 주세요. <br> 
					<input type="text" placeholder="pwd" id="pwd" name="pwd"> <br>
					<input type="submit" value="회원탈퇴" id="leaveBtn" >
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>