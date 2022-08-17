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

.btn-close {
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
</style>
<body>
    <div id="wrap">
        <div class="content view">
		
           
            <div>
                <div class="title">
                    ${data.board.title}
                </div>
                <div class="user">
                    <span class="user_img"><img src="/ro/upload/${loginInfo.m_filename_server}"></span>
                    <span>${data.board.id }</span>
                </div>
                
                <div id="count">
                        <span><b>조회수</b></span>
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
            <div class="map">
                <div id="map" style="width:500px;height:500px;"></div>
                <div>
                <table>
                	<tr>
                		<th></th>
                		<th>방제목</th>
                		<th>방장</th>
                		<th>시작일</th>
                		<th>종료일</th>
                		<th>참여인원</th>
                		<th></th>
                	</tr>
                	<c:forEach items="${data.roomList }" var="room">
	                	<tr>
	                		<td>
		                		<c:if test="${empty room.room_pwd }">
		                		공개방
		                		</c:if>
		                		<c:if test="${!empty room.room_pwd }">
		                		비밀방
		                		</c:if>
	                		</td>
	                		<td>${room.room_title}</td>
	                		<td>${room.roommaker_id}</td>
	                		<td>${room.room_startdate}</td>
	                		<td>${room.room_enddate}</td>
	                		<td>${room.room_participant_count }명${room.room_participant_no}</td>
	                		<td><input type="button" value="${room.room_participant_no != 0? '참여중' : '참여하기'  }" onClick='joinRoom("${room.room_pwd }", ${room.room_no });'></td>
	                	</tr>
                	</c:forEach>
                </table>
                </div>
				<input type="button" value="방 만들기" onClick="location.href='../room/write.do'">	
            </div>
            <div class="course">
                코스

            </div>
            <div class="reply">
                            

	                            <input type="text" name="content" id="content"  placeholder="댓글을 작성해주세요." style="width:80%">

	                            <div style="text-align:right;">
	                                <a href="javascript:goSave();">작성 </a>
	                            </div>

	                
	                <div id="commentArea"></div>

            </div>

   		</div>
	</div>
	

<!--  사용하다가 에러 안나면 지우자.
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
	<script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
	<script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>

-->	
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b93e1f37ba26daefa16850e15e3b7c31"></script>
	<script type='text/javascript' src="/ro/js/map.js"></script>
	<script type='text/javascript' src="/ro/js/mapView.js"></script>
    <script>

    	
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
    	
    	function getComment(page){
    	
    		$.ajax({
    			url : "/ro/reply/list.do",
    			data : {
    				'board_no' : ${data.board.board_no},
    				'board_name' : '${data.board.board_name}',
    				'page' : page
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
	    		$.ajax({
	    			url : "/ro/reply/insert.do",
	    			data : {
	    				board_no : 987697, 
	    				board_name : 'main',
	    				content : $("#content").val() //jquery
	    				//member_no : ${loginInfo.member_no} //el
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
    				'board_name' : '${data.board.board_name}',
    				'member_no' : 8,
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
    				'board_name' : '${data.board.board_name}',
    				'member_no' : 8,
    				dislikeCheck : dislikeCheck
    			},
    			success : function(i){
    				if(i==0){
						$("#dislikeCount").text("싫어요안누름");
					} else if(i==1){
						$("#dislikeCount").html("싫어요누름");
					}
    				dislikeCheck = i;
					
    			},
    			error : function(e){
    				console.log(e);
    			}
    			
    		});
	  	
    	}
    	
    
    </script>
    
</body>
</html>