<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <script>
window.onload=function(){
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
		//상단 아이콘 호버시 말풍선 나오게
		$('.menu li').hover(function(){
			$(this).find(".btn_ex").fadeIn()
		},function(){
			$(".btn_ex").fadeOut();
		})

  	// 미로그인시 아이콘 클릭시 뜨는 얼럿(정길)
  	function loginAlert(){
  		alert("로그인 후 이용해주세요 : )");
  	}
}
  
  </script>
<header class="sub_header">
	<div class="content">
		<h1><a href="/ro/board/main.do">DATARO</a></h1>
		<ul class="menu">
			<li>
				<c:choose>
	          		<c:when test="${empty loginInfo }">
		            	<a href="/ro/member/login" id="toPic">
		            		<img src ="/ro/img/profile.png" class="mbtn">
		            	</a> 
	            	</c:when>
	            	<c:otherwise>
	            		<a href="#">
			            <img src ="/ro/img/${loginInfo.m_filename_server}" id="idIm" style="border-radius:30px; width: 50px;">
			        </a>
	            	</c:otherwise>
				</c:choose>
			</li>
			<li>
	          	<a href="/ro/fullboard/fullmain.do">
            		<i class="fa-solid fa-clipboard"></i>
           	 	</a>  
           	 	<span class="btn_ex gmarket">자유<br>게시판</span>
			</li>
			<li>
				<a href="#" id="alarmForUser">
            		<i class="fa-solid fa-bell"></i>
            		<span id="theNumberOfMsg" style="position:relative; right:20px;"> ${UnreadMsgs }</span>
           		</a>
			</li>
			<li>
			 	<a href="/ro/board/travelWrite.do" id="wBtn">
            		<i class="fa-solid fa-marker"></i>
            	</a>
            	<span class="btn_ex gmarket">여행<br>글쓰기</span>
			</li>
		</ul>
	</div>
</header>