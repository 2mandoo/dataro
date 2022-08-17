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
  <link rel="stylesheet" href="/ro/resources/css/style2.css">
  <script src="/ro/js/jquery-3.3.1.min.js"></script>
  <script src="/ro/js/popper.min.js"></script>
  <script src="/ro/js/bootstrap.min.js"></script>
  <script src="/ro/js/main.js"></script>
  <script>
	function goWrite() {
 /*   		<c:if test="${empty loginInfo}">
  			alert('로그인 후 작성가능합니다!!');
  		</c:if> */
  		console.log(1);
	<c:if test="${empty loginInfo}">
  			location.href='write.do';
  		</c:if>
  	};
  </script>
    <title>FULL DATARO</title>
  </head>
  <body>
  <div class="content main">
    <div class="container">
      <h2 class="mb-5">DATARO 게시판</h2>
      <div class="table-responsive">
        <table class="table table-striped custom-table">
        <p><span><strong>총 ${flist.totalCount}개</strong>  |  ${fullboardVO.page } ${flist.totalPage}페이지</span></p>
		<span>게시판 목록</span>
          <thead>
            <tr>
              <th scope="col" >번호</th>
              <th scope="col" >제목</th>
              <th scope="col" >조회수</th>
              <th scope="col" >코스</th>
              <th scope="col" >게시일</th>
            </tr>
          </thead>
          <tbody>
     		<c:if test="${empty flist.list}">
                <tr>
                  <td class="first" colspan="7">등록된 글이 없습니다.</td>
                </tr>
            </c:if>
	          <c:forEach var ="vo" items="${flist.list}" varStatus="status">
	            <tr scope="row">
	            <td>${flist.totalCount-status.index-(fullBoardVO.page-1)*fullBoardVO.pageRow }</td>
	              <td><a href="view.do?board_no=${vo.board_no}">${vo.title}</a></td>
	              <td>${vo.viewcount}</td>
	              <td>${vo.board_name}</td>
	              <td><a href="view.do?board_no=${vo.board_no}">${vo.writedate}</td>
	            </tr>
	          </c:forEach>
          </tbody>
        </table> 
        <div class="btnSet"  style="text-align:right;">
          <a class="btn" href="javascript:goWrite();">글작성 </a>
       </div>
       </div>
       <div class="pagenate clear">
           <ul class='paging'>
           <c:if test="${flist.prev == true }">
           	<li><a href="fullmain.do?page=${flist.startPage-1 }&stype=${param.stype}&sword=${param.sword}"></a></li>
           </c:if>
           <c:forEach var="A" begin="${flist.startPage }" end="${flist.endPage }">
               <a href='fullmain.do?page=${A}&stype=${param.stype}&sword=${param.sword}'
               <c:if test="${fullBoardVO.page == A }">class='current'</c:if>>${A}</a>
           </c:forEach>
           <c:if test="${flist.next == true }">
           	<a href="fullmain.do?page=${flist.endPage+1 }
           	&stype=${param.stype}&sword=${param.sword}"></a>
           </c:if>
           </ul> 
       </div>
       	<div>
	      	<form id="frm" action="fullmain.do" >  <!-- 검색, 기본값 get 방식 -->
			<select id="form" name="stype" class="dSelect" title="검색분류 선택">
			<option value="title" >제목</option> 
			<option value="content" >내용</option>
			</select>
			<input type="text" id="" name="sword" value="" placeholder="검색">
			<input type ="submit"  value="검색">
			</form>
		</div>
      </div>
      	<div>

		</div>
    </div>
  </div>
  </body>
</html>