<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="sendMessage.do">
<h2>쪽지 보내기</h2>
<input type="hidden" name="send_member_no" value="${loginInfo.member_no }">
<input type="hidden" name="receive_member_no" value="${messageVO.receive_member_no }">
보내는 사람 : <input type="text" name="send_member_no" value="${loginInfo.id }"><br>
받는 사람 : <input type="text" name="receive_member_no" value="${messageVO.receive_member_id }"><br>
내용: <textarea name="message_content"></textarea>
<input type="submit" value="전송">
</form>
</body>
</html>