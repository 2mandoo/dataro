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
	var sword = $('#sword').val();
	var stype = $('#stype').val();
	$.ajax({
		url:"/ro/board/myList1",
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
 	$('#setbtn').click(function(){
 		location.href="/ro/member/editMemberInfo";
 	})
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
	<div class="content login">
		<form action="" method="post" >
		<img src="/ro/img/back.png" onclick="location.href='/ro/board/main.do'" id="backBtn">
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