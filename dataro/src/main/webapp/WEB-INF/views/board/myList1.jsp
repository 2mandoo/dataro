<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>게시판목록</title>
    <link rel="stylesheet" href="/ro/resources/css/login.css"/>
	<link rel="stylesheet" href="/ro/resources/css/reset.css"/>
<script>
$(function(){
	$('.title').click(function(){
		var board_no = $(this).prev('td')[0].innerText;
		$.ajax({
 			url : '/ro/board/view',
			type : 'post',
			data : {"board_no" : board_no},
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
	})
	$('#searchBtn').click(function(){
		myList();
	})
	
});
function myList() {
	var stype= $('#stype').val();
	var sword= $('#sword').val();
	$.ajax({
			url : '/ro/board/myList1',
		type : 'post',
		data : {
			stype : stype,
			sword : sword
		},
		success : function(e) {
			$("#area").html(e);
		},
		error : function(e){
			alert(`error`);
		}
		});
	return false;
}
</script>
</head> 
<body>
<div id="wrap">
	<div class="content login">
        <div id="area"></div>
	        <h1>내가 쓴 글</h1>
       	 	<div>
                <form method="post" name="Form" id="Form" action="" onsubmit="return myList();">
                    <span class="srchSelect">
                        <select id="stype" name="stype" value="${param.stype }">
                            <option value="title">글제목</option>
                        </select>
                    </span>
                    <span class="searchWord">
                        <input type="text" id="sword" name="sword" value="${param.sword }" >
                        <input type="button" id="searchBtn" value="검색" title="검색">
                    </span>
            	<table class="list">
            	<colgroup>
                    <col width="100px" />
                    <col width="100px" />
                    <col width="*" />
                    <col width=80px" />
                    <col width="100px" />
                </colgroup>
                <tr>
                    <th>게시판이름</th>
                    <th>게시물 번호</th>
                    <th>제목</th>
                    <th>조회수</th>
                    <th>작성일</th>
                </tr>
				<c:if test="${empty data.list }">
                   <tr>
                       <td class="first" colspan="5">작성한 글이 없습니다.</td>
                   </tr>
               	</c:if>
                <c:forEach var="vo" items="${data.list }" varStatus="status">
                    <tr>
                    	<td>${vo.board_name}</td>
                    	<td name="board_no">${vo.board_no}</td>
                        <td class="title" > <a>${vo.title}</a></td>
                        <td>${vo.viewcount }</td>
                        <td class="date"><fmt:formatDate value="${vo.writedate }" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </table>
            <div>
                <ul class='paging'>
                 	<c:if test="${data.prev == true }"> 
                 		<a href="javascript:getPage(${data.startPage-1})"> <- </a>
                 	</c:if>
                 	<c:forEach var="p" begin="${data.startPage }" end="${data.endPage }">
                    	<a href="javascript:getPage(${p})">${p }</a>
                    </c:forEach>
                    <c:if test="${data.next == true }">
                 		<a href="javascript:getPage(${data.endPage+1})" > -> </a>
                	</c:if>
               	</ul> 
            </div>
         </form>
        </div>
    </div>
</div>
</body>
</html>