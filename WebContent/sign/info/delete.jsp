<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session의 id받아와서 삭제하기
	String id=(String)session.getAttribute("id");
	boolean isSuccess=UsersDao.getInstance().delete(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>삭제중입니다.</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("탈퇴 성공 했습니다.");
		location.href="../../home.jsp";
		//탈퇴하고 세션 반납
		<%session.invalidate();%>
	</script>
<%}else{ %>
	<script>
		alert("탈퇴 실패 했습니다.");
		//탈퇴 실패시 정보 창으로
		location.href="info.jsp";
	</script>
<%} %>
</body>
</html>