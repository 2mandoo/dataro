<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" href="/ro/resources/css/style2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>게시판 상세</title>
<script>
 	function remove(board_no) {
  		if (confirm('삭제하시겠습니까?')) {
  			location.href='delete.do?board_no='+board_no;
  		}
  	}
	function getComment(page) {
		console.log(1);
		
		$.ajax({
			url : "/ro/comment/list.do",
			data : {
				board_no : ${view.board_no},
				board_name : '자유게시판',
				page : page
			},
			success : function(res) {
				$("#commentArea").html(res);
				console.log(1111111111111111);
			}
		});
	}
	$(function(){
		getComment(1);
	});
	function goSave() {
		<c:if test="${empty loginInfo}">
		alert('댓글은 로그인후 작성가능합니다. 로그인페이지에서 만나여');
		location.href='/ro/member/login.do';
		</c:if>
		<c:if test="${!empty loginInfo}">
		if (confirm('댓글을 저장하시겠습니까?')) {
			if($("#contents").val() == '') {
				alert("댓글 등록시 공백은 불가입니다. ㅠㅠ");
				$("#contents").focus();
			} else {
		    		$.ajax({
		    			url : "/ro/comment/insert.do",
		    			data : {
		    				board_no : ${view.board_no},
		    				board_name : '자유게시판',
		    				content : $("#contents").val(),
		    				member_no : ${loginInfo.member_no},
		    				id : "${loginInfo.id}"
		    				},
		    			success : function(res) {
		    				if (res.trim() == "1") {
		    					alert('정상적으로 댓글이 등록되었습니다.');
		    					$("#contents").val('');
		    					getComment(1);
			    			}
			    		}
			    	});
			}	
		}
		</c:if>
	}
	function commentDel(board_no) {
		if (confirm("댓글을 삭제하시겠습니까?")) {
			$.ajax({
				url : '/ro/comment/delete.do?board_no='+board_no,
				success : function(res) {
					if (res.trim() == '1') {
						alert('댓글이 정상적으로 삭제되었습니다.');
						getComment(1);
					}
				}
			})
		}
	}
	
</script>
</head>
<body>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">상세 게시판</h3>
                <div class="bbs">
                    <div class="view">
                        <div class="title">
                            <dl>
                                <dt>제목 : ${view.title}</dt><br>
                                <dt>게시일 : ${view.writedate}</dt>
                            </dl>
                        </div>
                        <div class="cont"><p>${view.content}</p> </div>
                        <dl class="file">
                            <dt>첨부파일 </dt>
                            <dd>
                         	<a href="/ro/common/download.jsp?oName=${URLEncoder.encode(view.filename_org,'UTF-8')}&sName=${view.filename_server}" 
                            target="_blank">${view.filename_org}</a></dd>
                        </dl>
                        <div class="btnSet clear">
                            <div class="fl_l">
                            	<a href="fullmain.do" class="btn">목록으로</a>
                            	<a href="modify.do?board_no=${view.board_no}" class="btn">수정</a>
                            	<a href="javascript:remove(${view.board_no});" class="btn">삭제</a>
                            </div>
                        </div>
                         <div>
                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
                        <table class="board_write">
                            <colgroup>
                                <col width="*" />
                                <col width="100px" />
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>
                                    <textarea name="contents" id="contents" style="height:50px;"></textarea>
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn" href="javascript:goSave();"><strong>댓글저장</strong> </a>
                                    </div>
                                </td>
                                <!-- <td>
                                    <div class="btnSet2"  style="text-align:right;">
                                        <a class="btn" href="javascript:goSave();"><strong>댓글삭제</strong> </a>
                                    </div>
                                </td> -->
                            </tr>
                            </tbody>
                        </table>
                        </form>

                        <div id="commentArea"></div>
                    </div>
                </div>
            </div>
            
     	</div>
     </div>
</body>
</html>