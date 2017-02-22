<%@page import="board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	//삭제 기능
	boolean isSuccess=BoardDao.getInstance().delete(num);
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
		alert("삭제 성공 하였습니다");
		location.href="../board.jsp";
	</script>
<%}else{ %>
	<script>
		alert("삭제 실패 하였습니다");
		location.href="../board.jsp";
	</script>
<%} %>
</body>
</html>