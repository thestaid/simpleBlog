<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	boolean isSuccess=UsersDao.getInstance().delete(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>회원 삭제중입니다.</title>
</head>
<body>
<%if(isSuccess){%>
	<script>
		alert("<%=id%> 님이 탈퇴되었습니다.");
		location.href="list.jsp";
	</script>
<%}else{ %>
	<script>
		alert("<%=id%> 님이 탈퇴가 실패했습니다.");
		location.href="list.jsp";
	</script>
<%} %>
</body>
</html>