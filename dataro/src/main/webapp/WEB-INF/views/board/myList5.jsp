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
	// 검색 버튼 클릭시 검색에 맞는 목록 호출.
	$('#searchBtn').click(function(){
		myList();
	}) 
});

function myList(){
	var stype= $('#stype').val();
	var sword= $('#sword').val();
	$.ajax({
			url : '/ro/board/myList5',
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
	        <h1 class="sub_title">보낸 쪽지함</h1>
       	 	<div>
                <form method="post" name="Form" id="searchForm" action="" onsubmit="return myList();"> 
                    <span class="srchSelect">
                        <select id="stype" name="stype" value="${param.stype }">
                            <option value="all">전체</option>
                            <option value="nickname">닉네임</option>
                            <option value="message_content">내용</option>
                        </select>
                    </span>
                    <span class="searchWord">
                        <input type="text" id="sword" name="sword" value="${param.sword }"  title="검색어 입력">
                        <input type="button" id="searchBtn" value="검색" title="검색">
                    </span>
            	<table class="list">
            	<colgroup>
                    <col width="100px" />
                    <col width="100px" />
                    <col width="*" />
                    <col width="150px" />
                </colgroup>
                <tr>
                    <th>닉네임</th>
                    <th>아이디</th>
                    <th>내용</th>
                    <th>받은 날짜</th>
                </tr>
				<c:if test="${empty data.list }">
                    <tr>
                        <td class="first" colspan="4">보낸 쪽지가 없습니다.</td>
                    </tr>
               	</c:if>
                <c:forEach var="vo" items="${data.list }" varStatus="status">
                    <tr>
                    	<td>${vo.nickname}</td>
                    	<td>${vo.id}</td>
                        <td>${vo.message_content}</td>
                        <td class="date"><fmt:formatDate value="${vo.senddate }" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </table>
            <div>
                <ul class='paging'>
                 	<c:if test="${data.prev == true }"> 
                 		<a href="javascript:getPage5(${data.startPage-1})"> <- </a>
                 	</c:if>
                 	<c:forEach var="p" begin="${data.startPage }" end="${data.endPage }">
                    	<a href="javascript:getPage5(${p})">${p }</a>
                    </c:forEach>
                    <c:if test="${data.next == true }">
                 		<a href="javascript:getPage5(${data.endPage+1})" > -> </a>
                	</c:if>
               	</ul> 
            </div>
         </form>
        </div>
    </div>
</div>
</body>
</html>