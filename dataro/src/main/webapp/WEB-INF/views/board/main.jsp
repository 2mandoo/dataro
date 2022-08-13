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
/* 	if (${empty loginInfo}){
		$('#idImg').hidden();
	} */
	
$(function(){
	$('#idImg').click(function(){
		location.href="/ro/member/myPage";
	})
});
</script>
</head>
<body>
  <div id="wrap">
    	<header>
        <div class="inner">
         	<h1>로고</h1>
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
		            <img src ="/ro/upload/${loginInfo.m_filename_server}" width="50px" id="idImg" style="border-radius:30px;">
            	</c:otherwise>
			</c:choose>            
            <a href="#">
            	<img src ="/ro/img/alarm.png" width="50px">
            </a>
            <a href="/ro/board/travelWrite.do">
            	<img src ="/ro/img/write.png" width="50px">
            </a>
          	</ul>
        </div>
    	</header>
	    <div> <!--여기도 forEach로 접근-->
	    <c:forEach var ="hashtag" items = "${list}">
	    <div style="display:inline-block; margin:0 10px;"><a href="">#${hashtag.hashtag_name}</a></div>
	    </c:forEach> 
	    </div>
	    <div class="content main">
	    <c:forEach var ="list" items="${list}">
     	<div class="cnt_set">
          	<h5>${list.title}</h5>
          	<span>
          	<c:set var="hashArr" value="${fn:split(list.hashtag_name, ',')}" />
         	<c:forEach var ="hword" items="${hashArr}">
         	#${hword} 
         	</c:forEach>
         	</span>
         	<div class="img_area">
            <a href="">이미지영역</a>
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
          <ul class="courselist">
            <li><span>●</span><span>국립익산박물관 값</span></li> <!-- 월요일에 물어보기  -->
            <li><span>●</span><span>국립익산박물관</span></li>
            <li><span>●</span><span>국립익산박물관</span></li>
            <li><span>●</span><span>국립익산박물관</span></li>
          </ul>
      </div>
      </c:forEach>
  	</div>
  </div>
</body>
</html>