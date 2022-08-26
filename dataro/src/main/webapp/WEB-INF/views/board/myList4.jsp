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
	
	// 답장하기 버튼 클릭시, 텍스트, 전송하기버튼 보이기.
	$('#btn-send').click(function(){
		$('#msgbox').show();
		$('#btn-send').hide();
		$('#btnSend').show();
		
	})
	
	$('#btnSend').click(function(){
		if (confirm('쪽지를 보내시겠습니까?')) {
			$('#thisForm').submit();
		} else {
			alert('쪽지를 보내는데 실패하셨습니다.');
		};
	})
});

function myList() {
	var stype= $('#stype').val();
	var sword= $('#sword').val();
	$.ajax({
		url : '/ro/board/myList4',
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
function modalFadeIn(msgContent, nick, no){
	console.log(no);
	$('.modal').fadeIn();
	$('#message_C').text(msgContent);
	$('#nick').text(nick);
	$('#receive_member_no').val(no);
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
.titlee a:hover{
	cursor:pointer;
	color: #0fbcf9;
	
}
</style>
</head> 
<body>
<div id="wrap">
	<div class="content login border">
        <div id="area"></div>
       	 	<div>
	        <h2>받은 쪽지함</h2>
                <form method="post" id="Frm" name ="Frm" onsubmit="return myList();"> 
                    <span class="srchSelect">
                        <select id="stype" name="stype" value="${param.stype }">
                            <option value="all">전체</option>
                            <option value="nickname">닉네임</option>
                            <option value="message_content">내용</option>
                        </select>
                    </span>
                    <span class="searchWord">
                        <input type="text" id="sword" name="sword" value="${param.sword }" >
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
                        <td class="first" colspan="5">받은 쪽지가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="vo" items="${data.list }" varStatus="status">
                    <tr>
                    	<td>${vo.nickname}</td>
                    	<td>${vo.id}</td>
                        <td class="titlee"><a href="javascript:modalFadeIn('${vo.message_content}', '${vo.nickname}', '${vo.send_member_no}')">${vo.message_content}</a></td>
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
                 		<a href="javascript:getPage4(${data.startPage-1})"> <- </a>
                 	</c:if>
                 	<c:forEach var="p" begin="${data.startPage }" end="${data.endPage }">
                    	<a href="javascript:getPage4(${p})">${p }</a>
                    </c:forEach>
                    <c:if test="${data.next == true }">
                 		<a href="javascript:getPage4(${data.endPage+1})" > -> </a>
                	</c:if>
               	</ul> 
            </div>
         </form>
         <form action="/ro/message/SM" method="post" id="thisForm">
			<div class="modal">
				<div class="modal-content">
					<a class="btn-close" href="javascript:modalFadeOut();">x</a>
					<table>
						<input type="hidden" id="send_member_no" name="send_member_no" value="${loginInfo.member_no }" >
						<input type="hidden" id="receive_member_no" name="receive_member_no" value="">
						<tr>
							<td style="text-align:right">From&nbsp</td>
							<td style="text-align:left" id="nick" name="nick"></td>
						</tr>
						
						<tr>
							<td colspan="2" id="message_C" name="message_C"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea style="display:none" id="msgbox" name="message_content" cols="30" rows="5"/></td>
						</tr>
						<tr><td></td></tr>
						<tr>
							<td colspan="2">
								<a href="#" id="btn-send">답장하기</a>
								<input type="button" id="btnSend" style="display:none" value="전송하기">
							</td>
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