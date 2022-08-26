<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
  <meta name="format-detection" content="telephone=no, address=no, email=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
<link rel="stylesheet" href="/ro/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="/ro/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/ro/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/ro/resources/css/style2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <title>게시판 등록</title>
  <script>
 	function goWriteSave() {
 		if($("#title").val() == '') {
 			alert("제목은 꼭 등록해주세요!!");
 			$("#title").focus();
 		} else {
 		alert("글작성완료 입니다!!!");
 		frm.submit();
 		}
 	}
 </script>
</head>
<body>
        <div class="content main">
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">글작성</h3>
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" >
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>게시판 구분</th>
                            <td>
                               <select id="form" name="board_name" class="board_name" title="board_name">
									<option value="자유게시판" >자유게시판</option>
                               </select>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="title" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <input type="text" name="content" id="content" class="content" value=""/>
                            </td>
                        </tr>
                        <tr>
                        	<th>첨부파일</th>
                        	<td>
                        		<input type="file" name="filename">
                        	</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                        <a class="btn" href="javascript:goWriteSave();">저장</a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
       </div> 
</body>
</html>