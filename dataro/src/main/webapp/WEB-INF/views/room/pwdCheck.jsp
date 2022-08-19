<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/ro/resources/css/reset.css" rel="stylesheet">
    <link href="/ro/resources/css/view.css" rel="stylesheet">
    <title>view</title>
</head>
<body>
<form action="pwdCheck.do" method="post">
<input type="hidden" name="board_name" value="${roomVO.board_name }">
<input type="hidden" name="board_no" value="${roomVO.board_no }">
<input type="hidden" name="room_no" value="${roomVO.room_no }">
<input type="text" name="room_pwd">
<input type="submit" value="참여">
</form>
</body>
</html>