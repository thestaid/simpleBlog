<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="users.dto.UsersDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	//회원 정보 수정
	boolean isSuccess=UsersDao.getInstance().update(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>수정중입니다.</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("<%=dto.getId()%>님의 정보가 수정되었습니다.");
		location.href="info.jsp";
	</script>
<%}else{ %>
	<script>
		alert("수정이 실패되었습니다.");
		location.href="info.jsp";
	</script>
<%} %>
</body>
</html>