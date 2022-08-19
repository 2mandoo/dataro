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
	$('#idImg').click(function(){
		location.href="/ro/member/myPage";
	});
	
	// 종 아이콘 클릭시 읽지 않은 쪽지 모달팝업(정길)
	$('#alarmForUser').click(function(){
		$.ajax({
			url : '/ro/member/alarm',
			type : 'post',
			data : {},
			success : function(e) {
				$("#areaForUser").html(e);
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
	
	$('.hash span').click(function(){
		const variable = document.getElementsById(hash1).value;
		console.log(variable);
	})
	
	
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
         	<h1>DaTaRo</h1>
	        <form id="frm" action="main.do" > 
			<select id="form" name="stype" class="dSelect" title="검색분류 선택">
			<option value="title" >제목</option> 
			<option value="content" >내용</option>
			</select>
			<input type="text" id="" name="sword" value="" placeholder="검색">
			<input type ="submit"  value="검색">
			</form>
            <ul>
            <a href="/ro/fullboard/fullmain.do">
            	<img src ="/ro/img/freeboard.png" width="50px">
            </a> 
          	<c:choose>
          		<c:when test="${empty loginInfo }">
	            	<a href="/ro/member/login" id="toPic">
	            		<img src ="/ro/img/profile.png" width="50px">
	            	</a> 
            	</c:when>
            	<c:otherwise>
            		<a href="#">
		            <img src ="/ro/img/${loginInfo.m_filename_server}" width="50px" id="idImg" style="border-radius:30px;">
		            </a>
            	</c:otherwise>
			</c:choose>            
            <a href="#" id="alarmForUser">
            	<img src ="/ro/img/alarm.png" width="50px">
            	<span id="theNumberOfMsg"> ${UnreadMsgs }</span>
            </a>
            
            <a href="/ro/board/travelWrite.do" id="wBtn">
            	<img src ="/ro/img/write.png" width="50px">
            </a>
		   
          	</ul>
        </div>
    	</header>
	    	<div style="display: inline-block; margin: 0 10px;" class="hash">
	    	<span id ="hash1" value="0" name="0">[#]</span>
		    <span value="1">[#자전거코스]</span>
		    <span value="2">[#드라이브코스]</span>
		    <span>[#뚜벅이코스]</span>
		    <span>[#가족과함께]</span>
		    <span>[#친구와함께]</span>
		    <span>[#연인과함께]</span>
		    <span>[#자연]</span>
		    <span>[#반려동물]</span>
		    <span>[#레포츠]</span>
		    <span>[#1박2일]</span>
		    <span>[#당일치기]</span>
		    <span>[#축제]</span>
		    <span>[#식도락]</span>
		    <span>[#역사]</span>
		</div>
	    <div class="content main">
	    <c:forEach var ="list" items="${list}">
     	<div class="cnt_set">
          	<h5>${list.title}</h5>글번호 : ${list.board_no}
          	<span>
          	<c:set var="hashArr" value="${fn:split(list.hashtag_name, ',')}" />
         	<c:forEach var ="hword" items="${hashArr}">
         	#${hword} 
         	</c:forEach>
         	</span>
         	<div class="img_area">
            <a href="view.do?board_no=${list.board_no}&board_name=${list.board_name}">이미지영역</a>
            <ul>
              <li>
                <span class="likecount">${list.likecount}</span>
                <span class="likecount_button"><button type="button" onclick="load()" >☆</button></span> <!-- load(this) -->
              </li>
              <li>
                <span>${list.dislikecount}</span>
                <span>☆</span>
              </li>
              <li>
                <span>${list.viewcount}</span>
                <span>☆</span>
              </li>
            </ul>
          </div>
          <ul class="courselist"><!-- forEach로 접근 -->
           	<c:forEach var="mvo" items="${list.placeList }">
            		<span>●</span><span>${mvo.place_name}</span>
            	</c:forEach>
            </li>
          </ul>
           
      </div>
      </c:forEach>
  </div>
  	<div class="modal">
		<div class="modal-content">
			<a class="btn-close" href="#none">X</a>
			<div id="areaForUser"></div>
		</div>
	</div>
</div>

</body>
</html>