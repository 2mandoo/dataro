<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<p><span><strong>총 ${comment.totalCount}개</strong>  |  ${commentVO.page }/${comment.totalPage }페이지</span></p>
                    <table class="list">
                      <div>[댓글목록]</div>
                      <div>[나의 회원번호 : <b>${loginInfo.member_no}</b>]</div>
                      <div>[나의 회원ID : <b>${loginInfo.id}</b>]</div>
                      <br>
                      <thead>
			            <tr>
			            	  <th scope="col" >회원번호</th>
			            	<th scope="col" >회원ID</th>
			              <th scope="col" >댓글번호</th>
			              <th scope="col" >댓글내용</th>
			              <th scope="col" >댓글등록일</th>
			            </tr>
			            	<colgroup>
                            <col width="100px" />
                            <col width="100px" />
                            <col width="200px" />
                        </colgroup>
			          </thead>
                        <tbody>
						<c:if test="${empty comment.list}">
                            <tr>
                                <td class="first" colspan="8">등록된 댓글이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:if test="${!empty comment.list}">
                        <c:forEach var="vo" items="${comment.list}">     
                            <tr>
                                <td>${vo.member_no}</td>
                                <td class="writer">${loginInfo.id}</td>
                                <td>${vo.reply_no}</td>
                                <td class="txt_l" style="text-align:left;">
                                    ${vo.content}  <c:if test="${loginInfo.member_no == vo.member_no }"><a href="javascript:commentDel(${vo.reply_no });">[삭제]</a></c:if>
                                </td>
                                <td class="date"><fmt:formatDate value="${vo.reply_writedate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                    <div class="pagenate clear">
                        <ul class='paging'>
                        <c:if test="${comment.prev == true }">
                        	<li><a href="javascript:getComment(${comment.startPage-1 })"></a><</li>
                        </c:if>
                        <c:forEach var="p" begin="${comment.startPage }" end="${comment.endPage }">
                            <a href='javascript:getComment(${p});' <c:if test="${commentVO.page == p }">class='current'</c:if>>${p }</a>
                        </c:forEach>
                        <c:if test="${comment.next == true }">
                        	<li><a href="javascript:getComment(${comment.endPage+1 })">></a>
                        </c:if>
                        </ul> 
                    </div>