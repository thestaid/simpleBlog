<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<style>
	.backgroundImg{
		width:100%;
	}
</style>
<title>수현의 과제 홈페이지 입니다.</title>
<jsp:include page="ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="ui/navbar.jsp">
	<jsp:param value="home" name="active"/>
</jsp:include>
<img src="resource/winter.jpg" alt="겨울그림" class="backgroundImg"/>
</body>
</html>