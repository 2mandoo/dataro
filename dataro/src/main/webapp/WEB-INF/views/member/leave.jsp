<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ro/resources/css/login.css"/>
<link rel="stylesheet" href="/ro/resources/css/reset.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div id="wrap">
	<div class="content login">
		<form action="leave" method="post">
			<h1>회원탈퇴</h1>
			${loginInfo.nickname } 님, 안녕하세요! <br>
			계정을 삭제하려고 하신다니 아쉽습니다. <br>
			회원 탈퇴를 원하시면 비밀번호를 입력해 주세요. <br> 
			<input type="text" placeholder="pwd" id="pwd" name="pwd"> <br>
			<input type="submit" value="회원탈퇴" id="leaveBtn" >
		</form>
	</div>
</div>
</body>
</html>