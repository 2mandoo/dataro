<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="chat_list">
	<ul>
		<c:forEach var="chat" items="${list}">
			<li <c:if test="${loginInfo.member_no eq chat.member_no}">class="me"</c:if>>
				<c:if test="${loginInfo.member_no ne chat.member_no}">
					<span>${chat.member_no }</span>
					<span>${mvo.id }</span>
				</c:if><!-- 야호 -->
				<span>${chat.content}</span>
				<span class="date">${chat.reply_writedate}</span>
			</li>
		</c:forEach>
	</ul>
</div>