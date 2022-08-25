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
<title>게시판 등록</title>
<link rel="stylesheet" href="/ro/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="/ro/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/ro/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/ro/resources/css/style2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function goModifySave() {
	if($("#title").val() == '') {
		alert("제목수정시 공백은 안됩니다 ㅠㅠ");
		$("#title").focus();
	} else {
		alert("제목수정 완료 입니다!!");
		update.submit();
	}
}
</script>
</head>
<body> 
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">수정게시판</h3>
    
                <div class="bbs">
                <form method="post" name="update" id="frm" action="update.do"><!-- enctype="multipart/form-data" -->
                <input type="hidden" name="board_no" value="${modify.board_no}">
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>제목수정</th>
                            <td>
                                <input type="text" name="title" id="title" class="wid100" value="${modify.title}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용수정</th>
                            <td>
                                <input type="text" name="content" id="content" class="wid100" value="${modify.content}"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                        <a class="btn" href="javascript:goModifySave();">저장 </a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        
</body>
</html>