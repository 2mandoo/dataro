<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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

 	$('#lo').hover(function(){
 		$('#lo').find('img').hide();
 		$('#red').show();
 	},function(){
 		$('#lo').find('img').hide();
 		$('#green').show();
 	});
 	
 	$('#goMain').click(function (){
		location.href="/ro/board/main.do";
	})
 	
});

function logout(){
	if(confirm('로그아웃 하시겠습니까?')) {
		location.href = "/ro/member/logout";
	} else {
		location.reload();
	}
}
</script>
<div id="wrap" >
	<div class="content login pa">
		<form action="" method="post" >
		<img src="/ro/img/main.png" id="goMain">
		<img src="/ro/img/setting.png" id="setbtn" ><br>
		<h1>MY PAGE</h1>
			<img src ="/ro/img/${loginInfo.m_filename_server}" id="idImg" >
			<h1 id="nic">${loginInfo.nickname}</h1>
			<a href="javascript:logout();" id="lo">
				<img id="green" src="/ro/img/read.png" width="30px">
				<img id="red" src="/ro/img/unread.png" width="30px" style="display:none;">
			</a>
			<input type="hidden" value="${loginInfo.member_no}" name="member_no" id="no"> 
			<div id = "bts">
				<img src="/ro/img/myArticle.png" id="bt1" class="bt6" title="내가 쓴 글">
				<img src="/ro/img/myReply.png" id="bt2" class="bt6" title="내가 쓴 댓글">
				<img src="/ro/img/heart.png" id="bt3" class="bt6" title="좋아요 누른 게시물">
				<img src="/ro/img/message2.png" id="bt4" class="bt6" title="받은 쪽지함">
				<img src="/ro/img/message3.png" id="bt5" class="bt6" title="보낸 쪽지함">
				<img src="/ro/img/room.png" id="bt6" class="bt6" title="내가 참여한 채팅방">
			</div>
			<div id="area"></div>
		</form>
	</div>
</div>	
</body>
</html>