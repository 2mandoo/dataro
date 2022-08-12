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
</head> 
<body>
<div id="wrap">
	<div class="content login">
        <div class="bbs" style="display:inline-block; height:200px; overflow-y:scroll;">
        <div id="area"></div>
	        <h1 class="sub_title">참여한 채팅방</h1>
       	 	<div>
                <form method="post" name="Form" id="searchForm" action="">
            	<table class="list">
            	<colgroup>
                    <col width="100px" />
                    <col width="100px" />
                    <col width="*" />
                    <col width="100px" />
                    <col width="150px" />
                </colgroup>
                <tr>
                    <th>게시판 이름</th>
                    <th>방번호</th>
                    <th>방제목</th>
                    <th>방장 아이디</th>
                    <th>방 만든 날짜</th>
                </tr>
				<c:if test="${empty list }">
                    <tr>
                        <td class="first" colspan="5">참여한 채팅방이 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="vo" items="${list }" varStatus="status">
                    <tr>
                    	<td>${vo.board_name}</td>
                    	<td>${vo.room_no}</td>
                        <td>${vo.room_title}</td>
                        <td>${vo.roommaker_id}</td>
                        <td class="date"><fmt:formatDate value="${vo.room_startdate }" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            	</table>
         	</form>
        	</div>
        </div>
    </div>
</div>
</body>
</html>