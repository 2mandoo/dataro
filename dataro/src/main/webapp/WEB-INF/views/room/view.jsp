<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임방 상세페이지</title>
<link rel="stylesheet" href="/ro/css/reset.css"/>
<link rel="stylesheet" href="/ro/css/style.css"/>
<style>
tr,td{border:1px solid #000}
</style>
</head>
<body>
    <div id="wrap">
        <div class="content room_view">
        	<table border="1" style="border:1px solid #000">
        		<tr><td>${view.room_title }</td></tr>
        		<tr><td>${view.room_content }</td></tr>
        	</table>
        	<form action="chatWrite" method="post">
        		<input type="hidden" name="room_no" value="${view.room_no }">
        		<input type="text" name="content" value="댓글을 입력하세요">
        		<input type="submit">
        	</form>
			<div id="chatArea">

			</div>
        </div>
    </div>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b93e1f37ba26daefa16850e15e3b7c31&libraries=services"></script>
<script>
$(function(){
	getchat();
})
function getchat(){
	$.ajax({
		url:"/ro/room/chatlist",
		data:{
			room_no:${param.room_no}
		},
		success:function(res){
			$("#chatArea").html(res)
		}
	})
}

function chatUpdate(){
	
	$.ajax({
		url:"ro/room/chatUpdate",
		success:function(res){
			$("#chatArea").html(res)
		}
	})
}
</script>

</body>
</html>