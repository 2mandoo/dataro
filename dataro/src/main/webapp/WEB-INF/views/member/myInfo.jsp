<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.net.URLEncoder" %>    
<%@ page import= "java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	$('#logout_btn').click(function(){
		location.href="/ro/member/logout";
	});
	$('#edit_btn').click(function(){
		location.href="/ro/member/editMemberInfo";
	});
	$('#img').click(function(){
		location.href="/ro/member/myPage";
	})
});
</script>
<form>
아이디 : ${loginInfo.id }	<br>
닉네임 : ${loginInfo.nickname} <br>
올린 게시물 수 : <br>
내 사진 : <img src ="/ro/upload/${loginInfo.m_filename_server}" width="100px" id="img"> <br> 
<input type="button" id="logout_btn" value="로그아웃">
</form>
</html>