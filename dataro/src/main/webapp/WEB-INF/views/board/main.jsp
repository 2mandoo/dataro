<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/ro/resources/css/style.css"/>
<link rel="stylesheet" href="/ro/resources/css/test.css"/>
<link rel="stylesheet" href="/ro/resources/css/reset.css"/>
<link href="https://www.flaticon.com/authors/freepik" title="Freepik">
<link href="https://image.flaticon.com/icons/png/512/1384/1384063.png" rel="shortcut icon" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>MAIN DATARO</title>
<script>
$(function(){
	
	// 로그인 후 변경된 사진 클릭시 마이페이지로 가기(정길)
	$('#idIm').click(function(){
		location.href="/ro/member/myPage";
	});
	
	// 종 아이콘 클릭시 읽지 않은 쪽지 모달팝업(정길)
	$('#alarmForUser').click(function(){
		$.ajax({
			url : '/ro/member/alarm',
			type : 'post',
			data : {},
			success : function(e) {  
				$("#areaForUser").html(e); // return "board/alarm"; 으로 해놔서, 해당 jsp가 해당 공간에 띄어짐.
			}
			
		});
		if (${!empty loginInfo}) {
			$('.modal').fadeIn();
		}
	});
	// 모달팝업 종료(정길)
	$('.btn-close').click(function(){
		$('.modal').fadeOut();
	});	

});

// 미로그인시 아이콘 클릭시 뜨는 얼럿(정길)
function loginAlert(){
	alert("로그인 후 이용해주세요 : )");
}


</script>
</head>
<body>
<div id="wrap">
    <header>
      <div class="inner">
         	<a href="/ro/board/main.do"><h1>DATARO</h1></a>
	        <form id="frm" action="main.do" > 
		        	<input type="hidden" name="stag" id="stag">
				<select id="form" name="stype" class="dSelect" title="검색분류 선택">
					<option value="title">제목</option>
					<option value="id">회원ID</option>
				</select>
					<input type="text" id="" name="sword" value="" placeholder="검색">
					<input type ="submit"  value="검색">
			</form>
            <ul>
            <a href="/ro/fullboard/fullmain.do">
            	<img src ="/ro/img/freeboard.png" class="mbtn">
            </a> 
          	<c:choose>
          		<c:when test="${empty loginInfo }">
	            	<a href="/ro/member/login" id="toPic">
	            		<img src ="/ro/img/profile.png" class="mbtn">
	            	</a> 
            	</c:when>
            	<c:otherwise>
            		<a href="#">
		            <img src ="/ro/img/${loginInfo.m_filename_server}" id="idIm" style="border-radius:30px; width: 50px; margin-right: 20px;">
		        </a>
            	</c:otherwise>
			</c:choose>            
            <a href="#" id="alarmForUser">
            	<img src ="/ro/img/alarm.png" class="mbtn">
            	<span id="theNumberOfMsg" style="position:relative; right:20px;"> ${UnreadMsgs }</span>
            </a>
            
            <a href="/ro/board/travelWrite.do" id="wBtn">
            	<img src ="/ro/img/write.png" class="mbtn">
            </a>
		   
          	</ul>
        </div>
    	</header>
	    	<div style="display: inline-block; margin: 0 10px;" class="hash">
	    	<script><!-- 메인페이지 해쉬태크 클릭시 해당 해쉬태그 값에 대한 게시물만 불러오는 함수 -->
	    	$(function() {
	    		$('.hashtag').click(function(){
	    			$("#stag").val($(this).data('no'));
	    			$("#frm").submit();
	    		})
	    	})
	    	</script>
	    		<span class='hashtag' data-no=''>[#전체]</span>
		    <span class='hashtag' data-no='1'>[#자전거코스]</span>
		    <span class='hashtag' data-no='2'>[#드라이브코스]</span>
		    <span class='hashtag' data-no='3'>[#뚜벅이코스]</span>
		    <span class='hashtag' data-no='4'>[#가족과함께]</span>
		    <span class='hashtag' data-no='5'>[#친구와함께]</span>
		    <span class='hashtag' data-no='6'>[#연인과함께]</span>
		    <span class='hashtag' data-no='7'>[#자연]</span>
		    <span class='hashtag' data-no='8'>[#반려동물]</span>
		    <span class='hashtag' data-no='9'>[#레포츠]</span>
		    <span class='hashtag' data-no='10'>[#1박2일]</span>
		    <span class='hashtag' data-no='11'>[#당일치기]</span>
		    <span class='hashtag' data-no='12'>[#축제]</span>
		    <span class='hashtag' data-no='13'>[#식도락]</span>
		    <span class='hashtag' data-no='14'>[#역사]</span>
		</div>
	    <div class="content main">
	    <c:forEach var ="list" items="${list}">
     	<div class="cnt_set">
          	<h5>${list.title}</h5>
          	</br>
          	<div><strong>글번호 : ${list.board_no} ㅣ 회원ID : ${list.id}</strong></div>
          	</br>
          	<span>
         	<c:forEach var ="hvo" items="${list.hashtagList}">
         	#${hvo.hashtag_name}
         	</c:forEach>
         	</span>
         	<div class="img_area">
            <a href="view.do?board_no=${list.board_no}&board_name=${list.board_name}">
             <img src ="/ro/img/${list.filename_server }" height="250px" width="400px" id="idImg" style="border-radius:100px;">
            </a>
            <ul>
              <li>
                 <span><b>${list.likecount}</b></span>
                  <span>좋아요</span>
              </li>
              <li>
               <span><b>${list.replycount}</b></span>
                <span>댓글수</span>
              </li>
              <li>
                <span><b>${list.viewcount}</b></span>
                <span>조회수</span>
              </li>
            </ul>
          </div>
          <ul class="courselist"><!-- forEach로 접근 -->
          	<li>
           	<c:forEach var="mvo" items="${list.placeList}">
            		<span>●</span><span>${mvo.place_name}</span><br>
            </c:forEach>
            </li>
          </ul>
           
      </div>
      </c:forEach>
  </div>
  	<div class="modal">
		<div class="modal-content">
			<a class="btn-close" href="#none">x</a>
			<div id="areaForUser"></div>
		</div>
	</div>
</div>
</body>
<script>

</script>
</html>