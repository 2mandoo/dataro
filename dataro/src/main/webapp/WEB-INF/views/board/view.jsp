<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/ro/resources/css/reset.css" rel="stylesheet">
    <link href="/ro/resources/css/view.css" rel="stylesheet">
    <title>view</title>
</head>

<style>
table, td, th {
  border : none;
  text-align:center;
};

* {
	box-sizing:border-box;
}

body {
	font-size:18px;
	margin:50px;
	line-height:1.5em;
}

a {
	text-decoration:none;
}

.modal {
	position:fixed;
	background-color:rgba(0,0,0,0.4);
	top:0;
	left:0;
	height:100vh;
	width:100%;
	display:none;
	z-index: 5;
}
.msgmodal {
	position:fixed;
	background-color:rgba(0,0,0,0.4);
	top:0;
	left:0;
	height:100vh;
	width:100%;
	display:none;
	z-index: 5;
}
.roommodal {
	position:fixed;
	background-color:rgba(0,0,0,0.4);
	top:0;
	left:0;
	height:100vh;
	width:100%;
	display:none;
	z-index: 5;
}

.modal-content{
	background-color:#fff;
	width:350px;
	border-radius:10px;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	padding:30px;
	box-shadow:0 0 15px rgba(0,0,0,0.15);
	text-align:center;
}
.modal-msgcontent{
	background-color:#fff;
	width:350px;
	border-radius:10px;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	padding:30px;
	box-shadow:0 0 15px rgba(0,0,0,0.15);
	text-align:center;
}
.modal-roomcontent{
	background-color:#fff;
	width:350px;
	border-radius:10px;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	padding:30px;
	box-shadow:0 0 15px rgba(0,0,0,0.15);
	text-align:center;
}

.btn-close {
	position : absolute;
	top:15px;
	right:15px;
}
.btn-msgclose {
	position : absolute;
	top:15px;
	right:15px;
}
.btn-roomclose {
	position : absolute;
	top:15px;
	right:15px;
}

.btn-edit {
	background-color:#616BEE;
	color:#fff;
	border-radius:5px;
	font-size:14px;
	padding:7px;
	display:block;
}
.btn-send {
	background-color:#616BEE;
	color:#fff;
	border-radius:5px;
	font-size:14px;
	padding:7px;
	display:block;
}
.btn-make {
	background-color:#616BEE;
	color:#fff;
	border-radius:5px;
	font-size:14px;
	padding:7px;
	display:block;
}

#header {
   background-color:lightgrey;
   height:100px;
}
#nav {
   background-color:#339999;
   width:500px;
   height:500px;
   float:left;
}
#section {
   width:700px;
   height:500px;
   text-align:left;
   float:left;
   padding:10px;
   overflow-y: scroll;
   background-color:#f3f3f3ee;
}
#footer {
   background-color:#f9effdee;
   height:450px;
   clear:both;
}


</style>
<style> <!-- 지도 마커라인 긋기-->
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#ffffffb8;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
</style>
<body>
    <div id="wrap">
        <div class="content view">
		${loginInfo.nickname }${loginInfo}hhhh
           ${loginInfo.m_filename_server}
            <div>
                <div class="title">
                    ${data.board.title}
                </div>
                <div class="user">
                    <span class="user_img"><img src="/ro/img/${loginInfo.m_filename_server}"></span>
                    <span>${data.board.id }</span>
                </div>
                
                <div id="count">
                        <span><img src="/ro/img/viewCount.png"></span>
                        <span>${data.board.viewcount }</span>

                        <a href="javascript:clickBoardLike();" id="likeCount"></a>
							
                        <a href="javascript:clickDislike();" id="dislikeCount"></a>
                </div>
            </div>

            <hr style="border: solid 1px black;">

            <div class="category">
            <c:forEach items="${data.categoryList }" var="cate">
                <c:if test="${!empty cate.region_name }">
                #${cate.region_name } <br>
                </c:if>
                <c:if test="${!empty cate.hashtag_name }">
                #${cate.hashtag_name }<br>
                </c:if>
            </c:forEach>
            </div>
            <div id="mapRoom">
	            <div id="nav">
	            <div id="map" style="width:500px;height:500px;"></div>
	            </div>
	            <div id="section">
	            <table>
	             	<tr>
	               		<th>방제목</th>
	               		<th>방장</th>
	               		<th>시작일</th>
	               		<th>종료일</th>
	               		<th>참여인원</th>
	               	</tr>
	               	<c:forEach items="${data.roomList }" var="room">
	                <tr>
	                	<td>
	                	${room.room_title}
	                		<c:if test="${empty room.room_pwd }">
		                	<img src="/ro/img/openRoom.png">
		                	</c:if>
		                	<c:if test="${!empty room.room_pwd }">
		                	<img src="/ro/img/secretRoom.png">
		                	</c:if>
	                	</td>
	                	<td>${room.roommaker_id}</td>
	                	<td>${room.room_startdate}</td>
	                	<td>${room.room_enddate}</td>
	                	<td>
	                	${room.room_participant_count }명
	                	<input type="button" value="${room.room_participant_no != 0? '참여중' : '참여하기'  }" onClick='joinRoom("${room.room_pwd }", ${room.room_no });'>
	                	</td>
	                </tr>
	               	</c:forEach>
	            </table>
				<input type="button" class="btn-makeclick" value="방 만들기">	
	            </div>
            </div>

            <div class="course">
                코스

            </div>
            <div id="footer" class="reply">
                            

	                            <input type="text" name="content" id="content"  placeholder="댓글을 작성해주세요." style="width:80%">

	                            <div style="text-align:right;">
	                                <a href="javascript:goSave();">작성 </a>
	                            </div>

	                
	                <div id="commentArea"></div>

            </div>

   		</div>
	</div>
	
	<!-- 방만들기 모달 -->
	<div class="roommodal">
   		<div class="modal-roomcontent">
			<a class="btn-roomclose" href="javascript:">X</a>
			<h3>Make Room</h3>
			<input type="hidden" id="board_name" name="board_name" value="main">
			<input type="hidden" id="board_no" name="board_no" value="${data.board.board_no}">
			<input type="hidden" id="roommaker_id" name="roommaker_id" value="test2">
			*방 제목 <input type="text" id="room_title" name="room_title" style="width:100%"><br>
			*방 내용 <textarea id="room_content" name="room_content" style="width:100%"></textarea><br>
			<b>[여행 시작날짜와 종료날짜를 선택해주세요]</b><br>
			*시작날짜 : <input type="date" id="room_startdate" name="room_startdate"> <br>
			*종료날짜 : <input type="date" id="room_enddate" name="room_enddate"  ><br>
			비밀번호 : <input type="password" id="room_pwd" name="room_pwd">
			<a class="btn-make" href="javascript:makeRoom();">방만들기</a>
		</div>
	</div>  
	<!-- 쪽지보내기 모달 -->
	<div class="msgmodal">
   		<div class="modal-msgcontent">
			<a class="btn-msgclose" href="javascript:">X</a>
			<h3>Send Message</h3>
			<input type="hidden" id="send_member_no" name="send_member_no" value="22" >
			<input type="hidden" id="receive_member_no" name="receive_member_no" value="33">
			보내는 사람 <input type="text" name="send_member_id" value="dd" readonly><br>
			받는 사람 <input type="text" name="receive_member_id" value="ss" readonly>
			<input type="text" id="message_content" placeholder="보낼 메세지를 입력하세요." style="width:100%">
			<a class="btn-send" href="javascript:sendMessage();">보내기</a>
		</div>
	</div>  

	<!-- 댓글 수정 모달 -->
	<div class="modal">
   		<div class="modal-content">
			<a class="btn-close" href="javascript:">X</a>
			<h3>Edit Reply</h3>
			<input type="text" id="replyUpdate" placeholder="수정할 내용을 입력하세요." style="width:100%">
			<input type="hidden" id="modal_rno" value="">
			<a class="btn-edit" href="javascript:commentEdit();">수정</a>
		</div>
	</div> 
	
<!--  사용하다가 에러 안나면 지우자.
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
>>>>>>> branch 'main' of https://github.com/2mandoo/dataro.git
	<script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
	<script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>

-->	
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b93e1f37ba26daefa16850e15e3b7c31"></script>
	<!-- 
	<script type='text/javascript' src="/ro/js/map.js"></script>
	<script type='text/javascript' src="/ro/js/mapView.js"></script>
    
    <script>
	$('.btn-makeclick').click(function(){
		$('.roommodal').fadeIn();
	})
	
	$('.btn-roomclose').click(function(){
		$('.roommodal').fadeOut();
		$("#room_title").val('');
		$("#room_content").val('');
		$("#room_startdate").val('');
		$("#room_enddate").val('');
		$("#room_pwd").val('');
	})
    	
    	var likeCheck = -1 ;
    	var dislikeCheck = -1;
    	function joinRoom(pwd, no){
    		alert(no);
    		if(confirm('방에 참여하시겠습니까?')){
    			
	    		if(pwd){
	    			location.href="../room/pwdForm.do?board_name=${data.board.board_name}&board_no=${data.board.board_no}&room_no="+no
	    		} else{
	    			location.href="../room/room.do?room_no="+no
	    		}
    		}
    		
    	}
    	
    	function makeRoom(){
    		var board_name = $("#board_name").val();
    		var board_no = $("#board_no").val();
    		var roommaker_id = $("#roommaker_id").val();
    		var room_title = $("#room_title").val();
    		var room_content = $("#room_content").val();
    		var room_startdate = $("#room_startdate").val();
    		var room_enddate = $("#room_enddate").val();
    		var room_pwd = $("#room_pwd").val();
      		if(confirm("방을 생성하시겠습니까?")){
    			$.ajax({
    				url : '/ro/room/write.do',
    				type : 'post',
    				data : {
    					board_name : board_name,
    					board_no : board_no,
    					roommaker_id : roommaker_id,
    					room_title : room_title,
    					room_content : room_content,
    					room_startdate : room_startdate,
    					room_enddate : room_enddate,
    					room_pwd : room_pwd
    				},
    				success : function(res){
    						if(res==1){
    							alert('새로운 방이 생성되었습니다.');
    						} else {
    							alert('방 생성 오류');
    						}
    						$(".roommodal").fadeOut();
    						$("#room_title").val('');
    						$("#room_content").val('');
    						$("#room_startdate").val('');
    						$("#room_enddate").val('');
    						$("#room_pwd").val('');
    						window.location.reload();
    				}
    			})
    		} 
    		
    	}
    	
    	
    	function sendMessage(){
    		var send_member_no = $("#send_member_no").val();
    		var receive_member_no = $("#receive_member_no").val();
    		var message_content = $("#message_content").val();
      		if(confirm("쪽지를 전송하시겠습니까?")){
    			$.ajax({
    				url : '/ro/message/sendMessage.do',
    				data : {
    					send_member_no : send_member_no,
    					receive_member_no : receive_member_no,
    					message_content : message_content
    				},
    				success : function(res){
    						if(res==1){
    							alert('쪽지가 정상적으로 전송되었습니다.');
    						} else {
    							alert('쪽지 전송 오류');
    						}
    						$('.msgmodal').fadeOut();
    						$("#message_content").val('');
    				}
    			})
    		} 
    	}
    	
    	function getComment(page){
    	
    		$.ajax({
    			url : "/ro/reply/list.do",
    			data : {
    				'board_no' : ${data.board.board_no},
    				'board_name' : ${data.board.board_name},
    				'page' : page,
    				member_no : 8
    			},
    			success : function(res){
    				
    				$("#commentArea").html(res);
    			},
    			error : function(e){
    				console.log(e);
    			}
    			
    		});
    		

    	};
    	
     	
    	$(function(){
    		//댓글 1페이지 불러오기
    		getComment(1); 
    		clickBoardLike();
    		clickDislike();
    	
    	});
    	 
    	function goSave(){
     		if(confirm('댓글을 작성하시겠습니까?')){
        		var board_name = $("#board_name").val();
        		var board_no = $("#board_no").val();
	    		$.ajax({
	    			url : "/ro/reply/insert.do",
	    			data : {
	    				board_no : board_no, 
	    				board_name : board_name,
	    				content : $("#content").val(),
	    				member_no : ${loginInfo.member_no}
	    			},
	    			success : function(res){
	    					if(res=="success"){
	    						alert('댓글이 정상적으로 등록되었습니다.');
	    					} else{
	    						alert('댓글 등록 실패');
	    					}
	    					getComment(1); //댓글 저장후 1페이지 다시 불러옴
	    					$("#content").val('');
	    					
	    			},
	    			error : function(e){
	    				console.log(e);
	    				console.log("Gosave error");
	    			}
	    			
	    		});
    		} 
    	}
    	
    	
    	function commentDel(no){
    		if(confirm("댓글을 삭제하시겠습니까?")){
    			$.ajax({
    				url : '/ro/reply/delete.do?reply_no='+no,
    				success : function(res){
    						alert('댓글이 정상적으로 삭제되었습니다.');
    						getComment(1);
    				}
    						
    			})
    		}
    	}
    	function setReply_no(no){
    		$('.modal').fadeIn();
    		$("#modal_rno").val(no);
    	}

    	
    	
    	function commentEdit(){
    		var reply_no = $("#modal_rno").val();
    		var content = $("#replyUpdate").val();
    		var page = $("#page").val();
    		console.log(page);
      		if(confirm("댓글을 수정하시겠습니까?")){
    			$.ajax({
    				url : '/ro/reply/update.do',
    				data : {
    					reply_no : reply_no,
    					content : content
    				},
    				success : function(){
    						alert('댓글이 정상적으로 수정되었습니다.');
    						getComment(page);
    						
    				}
    						
    			})
    		}  
    	}
    	
   
    	function clickBoardLike(){
    		$.ajax({
    			url : "/ro/board/initBoardLike.do",
    			method : "post",
    			data : {
    				'board_no' : ${data.board.board_no},
    				'board_name' : ${data.board.board_name},
    				'member_no' : ${loginInfo.member_no},
    				likeCheck : likeCheck
    			},
    			success : function(i){
					if(i==0){
						$("#likeCount").text("♡");
					} else if(i==1){
						$("#likeCount").html("♥");
					}
					likeCheck = i;
    			},
    			error : function(e){
    				console.log(e);
    			}
    			
    		});
    		
    	}
    	
    	function clickDislike(){
    		$.ajax({
    			url : "/ro/board/clickDislike.do",
    			method : "post",
    			data : {
    				'board_no' : ${data.board.board_no},
    				'board_name' : ${data.board.board_name},
    				member_no : ${loginInfo.member_no},
    				dislikeCheck : dislikeCheck
    			},
    			success : function(i){
    				if(i==0){
						$("#dislikeCount").html("<img src='/ro/img/dislike.png'>");
					} else if(i==1){
						$("#dislikeCount").html("<img src='/ro/img/checkDislike.png'>");
					}
    				dislikeCheck = i;
					
    			},
    			error : function(e){
    				console.log(e);
    			}
    			
    		});
	  	
    	}
    	
    
    </script>
     -->
</body>
</html>