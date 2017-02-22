<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="users.dto.UsersDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	//로그인폼에서 uri파라메터 가져오기
	String uri=request.getParameter("uri");
	//로그인 유효 체크
	boolean isValid=UsersDao.getInstance().isValid(dto);
	if(isValid){
		//로그인 성공하면 session값에 id값 넘겨주기
		session.setAttribute("id", dto.getId());
	}
		
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>로그인중</title>
</head>
<body>
<%if(isValid){ %>
	<script>
		alert("로그인 성공");
		//로그인 성공했을때 요청했던 페이지로 넘어가기
		location.href="<%=uri%>";
	</script>
<%}else{ %>
	<script>
		alert("로그인 실패");
		//로그인 실패하면 로그인페이지로 넘어가는데 uri값을 파라미터 값으로 들고가기
		location.href="signin_form.jsp?uri=<%=uri%>";
	</script>
<%} %>
</body>
</html>