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
	$('h3').mouseover(function(){
		
		$.ajax({
			url : 'myInfo',
			type : 'post',
			data : {},
			success : function(e) {
				console.log(e);
				$("#area1").html(e);
				
			},
			error : function(){
				alert(`알 수 없는 에러가 발생했습니다.`);
				
			}
		});
	});
	
	
	
	
	
	
});

</script>

<h1>메인페이지</h1>

<h2><a href="/ro/member/register" >회원가입</a></h2><br>
<h2><a href="/ro/member/login" >로그인하기</a></h2><br>

<h3>내정보아이콘</h3><br>
<div id="area1"></div>



</body>
</html>