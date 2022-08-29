<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/ro/resources/css/reset.css" rel="stylesheet">
    <link rel="stylesheet" href="/ro/resources/css/style.css"/>
    <link href="/ro/resources/css/view.css" rel="stylesheet">
    <link rel="shortcut icon" href="#"> <!-- favicon.ico 에러나서 넣어줌 -->
    <title>view</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b93e1f37ba26daefa16850e15e3b7c31"></script>

<body>
	<div id="wrap">
    	<%@ include file="/WEB-INF/views/common/subheader.jsp" %>
        <div class="content tv_write">
            <form action="insert.do" name="AH" id="save" method="post" enctype="multipart/form-data"  onsubmit="return goSave()";>
            <input type="hidden" name="id" value=${loginInfo.id }>
            <input type="hidden" name="member_no" value=${loginInfo.member_no }>
                <!--제목-->
                <div class="title">
                	<div class="title_top">
                		<div class="title_write">
		                    <span class="user">
		                        <span class="user_img" style="background-image:url(/ro/img/${loginInfo.m_filename_server})"></span>
		                        <p>${loginInfo.nickname }</p>
		                    </span>
		                    <input type="text" name="title" id="title" class="title_text gmarket" value="코스 제목">
		                    <input type="hidden" name="board_name" id="title" class="title_text" value="여행게시판">
	                    </div>
	                    <div class="hash">
	                      	<h3 class="gmarket">여행테마</h3>
	                   		<c:forEach var="hash" items="${category.hash}">
	                   			<label class="gmarket"><input type="checkbox" id="hash${hash.hashtag_no }" name="hashtag_no_arr" value="${hash.hashtag_no}">#${hash.hashtag_name}</label>
	                   		</c:forEach>
	                    </div>
                    </div>
                    <div class="region">
	                    	<input type="hidden" name="region_name" value="">
	                    	<select name="region" id="region" class="gmarket">
	                    		<option value="0" selected>지역</option>
	                    		<c:forEach var="region" items="${category.region}">
	                    			<option value="${region.region_name}" >${region.region_name }</option>
	                    		</c:forEach>
	                    	</select>
	                    	<ul class="region_result"></ul>
                    	<div class="region_detail"></div>
                    </div>
                </div>
                <!--지도,글쓰기-->
				<div class="map_wrap">
					
					<!-- 지도 나오는 곳 -->
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    
				    <!-- 검색 목록 -->
				    <div id="menu_wrap" class="bg_white" style="display:;">
				        <div class="option">
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				    
				</div>
				
				<!-- 지도 검색 엔터도 가능-->
				<div class="seracLocation">
					<div>
						<input type="text" value="종각역 맛집" id="keyword" onkeyup="enterkey()" size="15" class="gmarket" placeholder="지역을 검색하세요"> 
						<a onclick="jacascript:searchPlaces()" class="find_btn"><i class="fa-solid fa-magnifying-glass"></i></a>
						<a href="javascript:displayCouses(courseArr);" class="marker gmarket">[마커표시]</a>&nbsp;&nbsp;
					</div>
				</div>
				
				<!-- 코스 설명 들어갈 부분 -->      
				<div class="write_detail">
					<div class="scroll"></div>
				</div>
                <!--//지도,글쓰기-->

                <a href="javascript:goSave()" class="save">등록<i class="fa-solid fa-plus"></i></a>
            </form>
        </div>
    </div>
    

	
	<!-- 방비밀번호 모달 -->
	<div class="roompwdmodal">
   		<div class="modal-roompwdcontent">
   			<a class="btn-roompwdclose" href="javascript:"><img src="/ro/img/close.png"></a>
			<h3>Enter Password</h3>
			<form action="/ro/room/pwdCheck.do" method="post">
				<input type="hidden" name="board_name" value="${data.board.board_name}">
				<input type="hidden" name="board_no" value="${data.board.board_no}">
				<input type="hidden" id="room_no" name="room_no" value="">
				<input type="text" name="room_pwd">
				<input type="submit" value="참여">
			</form>	
		</div>
	</div>


	<!-- 방만들기 모달 -->
	<div class="roommodal">
   		<div class="modal-roomcontent">
			<a class="btn-roomclose" href="javascript:"><img src="/ro/img/close.png"></a>
			<h3>Make Room</h3>
			<input type="hidden" id="board_name" name="board_name" value="${data.board.board_name }">
			<input type="hidden" id="board_no" name="board_no" value="${data.board.board_no}">
			<input type="hidden" id="roommaker_id" name="roommaker_id" value="${loginInfo.id }">
			<input type="hidden" id="room_participant_no" name="room_participant_no" value="${loginInfo.member_no }">
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
			<a class="btn-msgclose" href="javascript:"><img src="/ro/img/close.png"></a>
			<h3>Send Message<img src="/ro/img/message.png"></h3>
			<input type="hidden" id="send_member_no" name="send_member_no" value="${loginInfo.member_no }" >
			<input type="hidden" id="receive_member_no" name="receive_member_no" value="">
			보내는 사람 <input type="text" name="send_member_id" value="${loginInfo.id }" readonly><br>
			받는 사람 <input type="text" name="receive_member_id" id="receive_member_id" value="" readonly>
			<input type="text" id="message_content" placeholder="보낼 메세지를 입력하세요." style="width:100%">
			<a class="btn-send" href="javascript:sendMessage();">보내기</a>
		</div>
	</div>  

	<!-- 댓글 수정 모달 -->
	<div class="modal">
   		<div class="modal-content">
			<a class="btn-close" href="javascript:"><img src="/ro/img/close.png"></a>
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
	
	
	<script type='text/javascript' src="/ro/js/map.js"></script>
	<script type='text/javascript' src="/ro/js/mapView.js"></script>
    
    <script>
    $(function(){
   		//댓글 1페이지 불러오기
   		getComment(1); 
   		clickBoardLike();
   		clickDislike();
   	
   		getAllCourse(); 
   	});

  //등록한글 불러오기(수정용)
	function updatebox(index,places){
		count++;
		var html ='<div class="set">'
			html +='<div class="map_list">'
			html += '<span class="markerbg marker_' + (index+1) + '"></span>'
					+'<span class="info">'+'<h5>' + places.place_name + '</h5>'+'</span>';
			html += '    <span>' +  places.address_name  + '</span>'; 
   			html += '  <span class="tel">' + places.phone  + '</span>'     
			html +="</div>"
	        html +='    <textarea placeholder="내용 입력" name="contents" readonly>'+places.content+'</textarea>'
	        html +='    <div class="pic_wrap">'
	        html +='        <div class="pic">'
	        html +='       		<img src="/ro/img/no-image.jpg">'
	        html +='     	</div>'
	        html +='   	 	<div class="pic">'
            html +='       		<img src="/ro/img/no-image.jpg">'
	        html +='      	</div>'
	        html +='    </div>'
	        html +='</div>'
			$('.scroll').append(html);
			 
	};
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
	$('.btn-roompwdclose').click(function(){
		$('.roompwdmodal').fadeOut();
		$("#room_pwd").val('');
	})
	
	var login_member_no;
	<c:if test="${empty loginInfo.member_no }">
    	login_member_no = -1
	</c:if>
	<c:if test="${!empty loginInfo.member_no }">
    	login_member_no = ${loginInfo.member_no}
	</c:if>
	console.log(login_member_no);
	
    	var likeCheck = -1 ;
    	var dislikeCheck = -1;
    	
    	function joinRoom(pwd, no){
    		alert(no);
    		if(confirm('방에 참여하시겠습니까?')){
    			
	    		if(pwd){
	    			// location.href="../room/pwdForm.do?board_name=${data.board.board_name}&board_no=${data.board.board_no}&room_no="+no
	    			$('#room_no').val(no);
	    			$('.roompwdmodal').fadeIn();
	    		} else{
	    			location.href="../room/room.do?room_no="+no;
	    			
	    		}
    		}
    		
    	}
    	
    	function makeRoom(){
    		var board_name = $("#board_name").val();
    		var board_no = $("#board_no").val();
    		var room_participant_no = $("#room_participant_no").val();
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
    					room_pwd : room_pwd,
    					room_participant_no : room_participant_no
    					
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
    				'board_name' : '${data.board.board_name}',
    				'page' : page,
    				member_no : login_member_no
    			},
    			success : function(res){
    				
    				$("#commentArea").html(res);
    			},
    			error : function(e){
    				console.log(e);
    			}
    			
    		});
    		

    	};
    	
     	
    	 
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
	    				member_no : login_member_no,
	    				member_id : '${loginInfo.id}'
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
    	
    	
    	function viewDel(){
    		if(confirm("글을 삭제하시겠습니까?")){
    			delFrm.submit();
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
    						$('.modal').fadeOut();
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
    				'member_no' : login_member_no,
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
    				member_no : login_member_no,
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
     
</body>
</html>