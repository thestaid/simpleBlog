<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//로그아웃 기능(세션값 반환)
	session.invalidate();
	String uri=request.getParameter("uri");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>로그아웃 중입니다.</title>
<jsp:include page="../ui/myResource.jsp">
	<jsp:param value="signOut" name="active"/>
</jsp:include>
</head>
<body>
	<script>
		alert("로그아웃 했습니다.");
		//로그아웃하면 요청한 페이지로 넘어가기
		location.href="../home.jsp";
	</script>
</body>
</html>