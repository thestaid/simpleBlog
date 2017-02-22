<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="users.dto.UsersDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String contextPath=request.getContextPath();
	//회원가입 기능
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	String uri=request.getParameter("uri");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>회원가입중</title>
</head>
<body>
<%if(isSuccess){%>
	<script>
		alert("가입 완료 되었습니다.");
		//가입완료하면 로그인페이지로 넘어가는데 요청한 원래 페이지의 uri값을 들고간다.
		location.href="<%=contextPath%>/sign/signin_form.jsp?uri=<%=uri%>";
	</script>
<%}else{ %>
	<script>
		alert("가입 실패 했습니다.");
		//가입실패하면 회원가입 페이지로 넘어가는데 원래 요청한 페이지의 uri값을 들고간다.
		location.href="<%=contextPath%>/sign/signup_form.jsp?uri=<%=uri%>";	
	</script>
<%} %>
</body>
</html>