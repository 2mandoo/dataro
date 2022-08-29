<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/ro/resources/fonts/icomoon/style.css">
  <link rel="stylesheet" href="/ro/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/ro/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/ro/resources/css/style.css">
  <link rel="stylesheet" href="/ro/resources/css/style2.css">
  <script src="/ro/js/jquery-3.3.1.min.js"></script>
  <script src="/ro/js/popper.min.js"></script>
  <script src="/ro/js/bootstrap.min.js"></script>
  <script src="/ro/js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  	// 자유게시판 글쓰기는 로그인 후 가능하도록 하기(호윤)
	function goWrite() {
 		<c:if test="${empty loginInfo}">
 			alert('글쓰기는 로그인 후 작성가능합니다!! 로그인페이지에서 만나여')
 			location.href='/ro/member/login.do';
 		</c:if>
		<c:if test="${!empty loginInfo}">
 			location.href='write.do';
 		</c:if>
 	}
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

  	});

  	// 미로그인시 아이콘 클릭시 뜨는 얼럿(정길)
  	function loginAlert(){
  		alert("로그인 후 이용해주세요 : )");
  	}
  </script>
    <title>DATARO</title>
  </head>
  <body>
  <a href="/ro/board/main.do"><h1>☞메인페이지로 이동☜</h1></a>
  <div id="wrap">
    <div class="content">
    		<ul>
          	<c:choose>
          		<c:when test="${empty loginInfo }">
	            	<a href="/ro/member/login" id="toPic">
	            		<img src ="/ro/img/profile.png" width="50px"><b>[로그인]<b>
	            	</a> 
            	</c:when>
            	<c:otherwise>
            		<a href="#">
		            <img src ="/ro/img/${loginInfo.m_filename_server}" width="50px" id="idImg" style="border-radius:30px;">
		        </a>
            	</c:otherwise>
			</c:choose>            
            <a href="/ro/board/travelWrite.do" id="wBtn">
            	<img src ="/ro/img/write.png" width="50px"><b>[여행글쓰기]<b>
            </a>
          </ul>
      <h2 class="mb-5">[ dataro 자유게시판 ]</h2>
      <div>나의 ID : 
		<choose>
			<when test="loginInfo.id==null"> 로그인해주세요 </when>

			<otherwise>  </otherwise>
		</choose>
      	${loginInfo.id}
      </div>
      <div class="table-responsive">
        <table class="table table-striped custom-table" style="margin-left: auto; margin-right: auto;">
        <p><span><strong>총 ${flist.totalCount}개</strong>  |  ${fullboardVO.page } ${flist.totalPage}페이지</span></p>
		<span>게시판 목록</span>
          <thead>
            <tr>
              <th scope="col" >번호</th>
              <th scope="col" >제목</th>
              <th scope="col" >조회수</th>
              <th scope="col" >게시판</th>
              <th scope="col" >게시일</th>
              <th scope="col" >회원ID</th>
            </tr>
          </thead>
          <tbody>
     		<c:if test="${empty flist.list}">
                <tr>
                  <td class="first" colspan="10">등록된 글이 없습니다.</td>
                </tr>
            </c:if>
	          <c:forEach var ="vo" items="${flist.list}" varStatus="status">
	            <tr scope="row">
	            <td>${flist.totalCount-status.index-(fullBoardVO.page-1)*fullBoardVO.pageRow }</td>
	              <td><a href="view.do?board_no=${vo.board_no}">${vo.title}</a></td>
	              <td>${vo.viewcount}</td>
	              <td>${vo.board_name}</td>
	              <td><a href="view.do?board_no=${vo.board_no}"><fmt:formatDate value="${vo.writedate}" pattern="yyyy-MM-dd HH:mm"/></td>
	              <td>${vo.id}</td>
	            </tr>
	          </c:forEach>
          </tbody>
        </table> 
        <div class="btnSet"  style="text-align:right;">
          <a class="btn" href="javascript:goWrite();"><strong>글작성</strong> </a>
       </div>
       </div>
       <div class="pagenate clear"> <!-- 페이징 처리 -->
           <ul class='paging'>
           <c:if test="${flist.prev == true }">
           	<li><a href="fullmain.do?page=${flist.startPage-1}&stype=${param.stype}&sword=${param.sword}"><</a></li>
           </c:if>
           <c:forEach var="A" begin="${flist.startPage}" end="${flist.endPage}">
               <a href='fullmain.do?page=${A}&stype=${param.stype}&sword=${param.sword}'
               <c:if test="${fullBoardVO.page == A }">
               class='current'
               </c:if>>${A}</a>
           </c:forEach>
           <c:if test="${flist.next == true }">
           	<a href="fullmain.do?page=${flist.endPage+1}
			&stype=${param.stype}&sword=${param.sword}">></a>
           </c:if>
           </ul> 
       </div>
       	<div>
	      	<form id="frm" action="fullmain.do" > <!-- 하단부 검색 -->
			<select id="form" name="stype" class="dSelect" title="검색분류 선택">
			<option value="title" >제목</option> 
			<option value="content" >내용</option> 
			<option value="id" >회원ID</option> 
			</select>
			<input type="text" id="" name="sword" value="" placeholder="검색">
			<input type ="submit"  value="검색">
			</form>
		</div>
      </div>
    </div>
  </body>
</html>