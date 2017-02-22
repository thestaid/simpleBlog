<%@page import="board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="board.dto.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>    
<%
	String id=(String)session.getAttribute("id");
	//글 등록 기능
	boolean isSuccess=BoardDao.getInstance().insert(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>글 저장중입니다.</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("글이 등록되었습니다.");
		location.href="../board.jsp";
	</script>
<%}else{ %>
	<script>
		alert("글이 등록 실패 되었습니다.");
		location.href="../board.jsp";
	</script>
<%} %>	
</body>
</html>