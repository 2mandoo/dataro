<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>게시판 상세</title>
<link rel="stylesheet" href="/project/css/reset.css"/>
<link rel="stylesheet" href="/project/css/contents.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$('.btn').click(function(){
		alert();
	})
})
</script>
</head>
<body>
<div id="wrap">
	<div class="content login">
	    <div class="view">
	        <div class="title">
	        	<form method="post" name="frm" id="frm" action="" >
		        	<table border="1">	
		        		<tr>
		        			<th>${data.title }</th>
		        			<td>${data.writedate }</td>
		        		</tr>
		        		<tr>
		        			<td colspan="2">${data.content }</td>
		        		</tr>
		        		<tr>
		        			<td colspan="2"><a href="javascript:getPage3()"><b>목록으로</b></a></td>
		        		</tr>
		        	</table>
	        	</form>
	     	</div>
   	    </div>
    </div>
</div>
</body>
</html>