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
function deleteMsg(){
		console.log($('#Frm').serialize());
	$.ajax({
		url : '/ro/member/deleteProcess',
		type : 'post',
		data : $('#Frm').serialize(),
		success : function(e) {
			if (e === 1)
			alert(`쪽지가 삭제되었습니다`);
			myList();
		},
		error : function(e){
			alert(`삭제할 쪽지를 체크해주세요 : )`);
		}
	});
}
function modalFadeIn(msgContent){
	$('.modal').fadeIn();
	console.log(msgContent);
	$('#message_content').text(msgContent);
	
}
function modalFadeOut(){
	$('.modal').fadeOut();
}

if(${empty data.list}){
	$('#delAtag').hide();
} else {
	$('#delAtag').show();
}
</script>
<style>
#wrap .modal-content table tr td {
    white-space: initial;
    text-overflow: initial;
}


</style>
</head> 
<body>
<div id="wrap">
	<div class="content login border">
        <div id="area"></div>
       	 	<div>
	        <h2>보낸 쪽지함</h2>
                <form method="post" name="Frm" id="Frm" onsubmit="return myList();"> 
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
                    <col width="80px" />
                    <col width="80px" />
                    <col width="*" />
                    <col width="150px" />
                    <col width="70px" />
                </colgroup>
                <tr>
                    <th>닉네임</th>
                    <th>아이디</th>
                    <th>내용</th>
                    <th>받은 날짜</th>
                    <th>쪽지삭제</th>
                </tr>
				<c:if test="${empty data.list }">
                    <tr>
                        <td class="first" colspan="5">보낸 쪽지가 없습니다.</td>
                    </tr>
               	</c:if>
                <c:forEach var="vo" items="${data.list }" varStatus="status">
                    <tr>
                    	<td>${vo.nickname}</td>
                    	<td>${vo.id}</td>
                        <td class="titlee"><a href="javascript:modalFadeIn('${vo.message_content}')">${vo.message_content}</a></td>
                        <td class="date"><fmt:formatDate value="${vo.senddate }" pattern="yyyy-MM-dd"/></td>
                        <td><input type="checkbox" class="selected" name="message_no" value="${vo.message_no }"></td>
                    </tr>
                </c:forEach>
                <tr>
                	<td colspan="5" style="text-align:right;">
                	<a id ="delAtag" href="javascript:deleteMsg();" >
                		<img src="/ro/img/trashcan.png" width="30px;" style="position: relative; right: 9px; bottom: 10px;">
                	</a>
                	</td>
                </tr>
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
         <form action="" method="post">
			<div class="modal">
				<div class="modal-content">
					<a class="btn-close" href="javascript:modalFadeOut();">x</a>
					<table style="all:none;">
						<tr><td>내용</td></tr>
						<tr>
							<td id="message_content" name="message_content"></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
        </div>
    </div>
</div>
</body>
</html>