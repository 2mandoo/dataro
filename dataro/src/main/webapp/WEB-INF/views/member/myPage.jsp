<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function getPage(page){ 
	$.ajax({
		url:"/ro/board/myList1",
		type:'post',
		data:{
			page: page,
			sword : $('#sword').val(),
			stype: $('#stype').val()
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage2(page){ 
	var sword = $('#sword').val();
	var stype = $('#stype').val();
	$.ajax({
		url:"/ro/board/myList2",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage3(page){ 
	var sword = $('#sword').val();
	var stype = $('#stype').val();
	$.ajax({
		url:"/ro/board/myList3",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage4(page){ 
	var sword = $('#sword').val();
	var stype = $('#stype').val();
	$.ajax({
		url:"/ro/board/myList4",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage5(page){ 
	var sword = $('#sword').val();
	var stype = $('#stype').val();
	$.ajax({
		url:"/ro/board/myList5",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};


$(function(){
	// 회원정보수정으로 가기
 	$('#setbtn').click(function(){
 		location.href="/ro/member/editMemberInfo";
 	})
 	// 내가 쓴 글
 	$('#bt1').click(function(){
 		$.ajax({
 			url : '/ro/board/myList1',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 쓴 댓글
	$('#bt2').click(function(){
 		$.ajax({
 			url : '/ro/board/myList2',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 좋아요 누른 게시물
	$('#bt3').click(function(){
 		$.ajax({
 			url : '/ro/board/myList3',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 받은 쪽지
	$('#bt4').click(function(){
 		$.ajax({
 			url : '/ro/board/myList4',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 보낸 쪽지
	$('#bt5').click(function(){
 		$.ajax({
 			url : '/ro/board/myList5',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 참여한 채팅방
	$('#bt6').click(function(){
 		$.ajax({
 			url : '/ro/board/myList6',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
});
</script>
<div id="wrap" >
	<div class="content login pa">
		<form action="" method="post" >
		<a href="/ro/board/main.do"><img src="/ro/img/main.png" id="goMain"></a>
		<img src="/ro/img/icon6.png" id="setbtn" ><br>
		<h1>my page</h1>
			<img src ="/ro/img/${loginInfo.m_filename_server}"  id="idImg" >
			<h1 id="nic">${loginInfo.nickname}</h1>
			<a href="/ro/member/logout" id="lo">로그아웃</a>
			<input type="hidden" value="${loginInfo.member_no}" name="member_no" id="no"> 
			<div>
				<img src="/ro/img/icon1.png" id="bt1" style="width:70px">
				<img src="/ro/img/icon2.png" id="bt2" style="width:70px">
				<img src="/ro/img/icon3.png" id="bt3" style="width:70px">
				<img src="/ro/img/icon4.png" id="bt4" style="width:70px">
				<img src="/ro/img/icon7.png" id="bt5" style="width:70px">
				<img src="/ro/img/icon5.png" id="bt6" style="width:70px">
			</div>
			<div id="area"></div>
		</form>
	</div>
</div>	
</body>
</html>