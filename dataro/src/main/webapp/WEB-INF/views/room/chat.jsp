<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="chat_list" style="board:1px solid red">
	<table>
		<colgroup>
			<col width="200px">
			<col width="*">
			<col width="100px">
			<col width="100px">
			<col width="100px">
		</colgroup>
		<c:forEach var="chat" items="${list}">
			<tr>
				<td>${chat.member_id }</td>
				<td>
					${chat.content}
				</td>
				<td>${chat.reply_writedate}</td>
				<td><a href="javascript:chatUpdate(${chat.member_no })"></a>수정</td>
				<td>삭제</td>
			</tr>
		</c:forEach>
	</table>
</div>