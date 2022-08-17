<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<p><span><strong><img src="/ro/img/repl
y.jpeg" width="30px">댓글(${reply.totalCount })</strong>  |  ${replyVO.page }/${reply.totalPage }페이지</span></p>
   <table class="list">
       <colgroup>
           <col width="80px" />
           <col width="100px" />
           <col width="*" />
           <col width="200px" />
       </colgroup>
       <tbody>
       <c:if test="${empty reply.list}">
           <tr>
               <td class="first" colspan="8">등록된 댓글이 없습니다.</td>
           </tr>
       </c:if>

       <c:if test="${!empty reply.list}">
       <c:forEach var="vo" items="${reply.list }" varStatus="idx" >
	           <tr>
	               <td>${reply.pagingCount-(10*(replyVO.page-1))-idx.index }</td>
	               <td class="writer">
	                   ${vo.member_id }
	               </td>
	               <td class="txt_l" style="text-align:left">
	                   <%-- ${vo.content } <c:if test="${loginInfo.member_no==vo.member_no }"><a href="javascript:commentDel(${vo.reply_no });">[삭제]</a></c:if> --%>
	                   ${vo.content }
	                   <a href="javascript:setReply_no(${vo.reply_no });">[수정]</a>
	                   <a href="javascript:commentDel(${vo.reply_no });">[삭제]</a>
	                   <a href="javascript:replyList(${vo.gno })" class="replyList">[답글]<c:if test="${vo.replycount>0 }">(${vo.replycount })</c:if></a>
	                   <div class="messageBox" style="display:none;" >
	                   <form id="replyFrm${vo.gno }">
						    <input type="text" class="content2" placeholder="답글을 작성해주세요."><a href="javascript:goSave2(${vo.gno });">저장 </a>
					   </form>
						    <div id="replyList${vo.gno }"></div>
					   </div>
	               </td>
	               <td class="date"><fmt:formatDate value="${vo.reply_writedate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	           </tr>
           
       </c:forEach>    
       </c:if>    
       </tbody>
   </table>
   <!-- 댓글 페이징 처리 -->
   <div class="pagenate clear">
       <ul class='paging'>
       <c:if test="${reply.prev==true }">
       	 <a href="javascript:getComment(${reply.startPage-1 });"><</a>
       </c:if>
         	 <c:forEach var="p" begin="${reply.startPage }" end="${reply.endPage }">
     			 <a href="javascript:getComment(${p });" class="${replyVO.page == p? 'current' : '' }">${p }</a>
         	 </c:forEach>
       <c:if test="${reply.next==true }">
      	 <a href="javascript:getComment(${reply.endPage+1 });">></a>
       </c:if>
       </ul> 
       <!-- 댓글 수정한 후 해당 페이지 불러오기 위해 page를 hidden으로 넘김 -->
       <input type="hidden" id="page" value="${page }">
   </div>
	<!-- 모달 -->
	<div class="modal">
   		<div class="modal-content">
			<a class="btn-close" href="javascript:">X</a>
			<h3>Edit Reply</h3>
			<label>Reply</label> <input type="text" id="replyUpdate" placeholder="New Reply">
			<input type="hidden" id="modal_rno" value="">
			<a class="btn-edit" href="javascript:commentEdit();">수정</a>
		</div>
	</div>  
   
	<script>

	$('.btn-close').click(function(){
		$('.modal').fadeOut();
		$("#replyUpdate").val('');
	})

	$('.replyList').click(function(){
		$(this).next().toggle();
	})
    function replyList(gno){
		$.ajax({
			url : "/ro/reply/replyList.do",
			data : {
				board_no : 987697, 
				board_name : 'main',
				gno : gno
				//member_no : ${loginInfo.member_no} //el
			},
			success : function(res){
					console.log(res.length);
					console.log(res);
					console.log(res[0]);
					
					var html="";
					if(res.length == 0){
						console.log(333);
					} else {
						html += "<table border='1' style='width: 600px'>";
						html += "<tr>";
						html += "	<th>id</th>";
						html += "	<th>내용</th>";
						html += "	<th>작성날짜</th>";
						html += "</tr>";
						for(i=0;i<res.length;i++){
							html += "<tr>";
							html += "	<td style='text-align:center;'>"+res[i].member_id+"</td>";
							html += "	<td style='text-align:center;'>"+res[i].content;
							html += "	<a href='javascript:commentDel("+res[i].reply_no +");'>[삭제]</a></td>";
							html += "	<td style='text-align:center; height:50px;'>" + res[i].reply_writedate + "</td>";
							
							html += "</tr>";
						}
						html += "</table>";
					}
	
					$("#replyList"+gno).html(html); 
				
					
			},
			error : function(e){
				console.log(e);
				console.log("Gosave error");
			}
			
		});
		
  	}
    
    
  	function goSave2(gno){
  		console.log($("#replyFrm"+gno+" .content2").val());
  		console.log(gno);
		if(confirm('댓글을 작성하시겠습니까?')){
			$.ajax({
				url : "/ro/reply/reply.do",
				data : {
					board_no : 987697, 
					board_name : 'main',
					content : $("#replyFrm"+gno+" .content2").val(),
					gno : gno
					//member_no : ${loginInfo.member_no} //el
				},
				success : function(res){
						if(res=="success"){
							alert('댓글이 정상적으로 등록되었습니다.');
						} else{
							alert('댓글 등록 실패');
						}
						getComment(1); //댓글 저장후 1페이지 다시 불러옴
						$("#replyFrm"+gno+" .content2").val('');
						
				},
				error : function(e){
					console.log(e);
					console.log("Gosave error");
				}
				
			});
		} 
	}
	</script>
  
  
  
  
  