<%@page import="board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="board.dto.BoardDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	//게시글 수정하는 기능
	boolean isSuccess=BoardDao.getInstance().update(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>수정 중입니다.</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("수정완료 되었습니다.");
		location.href="../board.jsp";
	</script>
<%}else{ %>
	<script>
		alert("수정실패 되었습니다.");
		location.href="../board.jsp";
	</script>
<%} %>
</body>
</html>