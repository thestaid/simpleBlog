<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//홈으로 넘어 갈수 있게 하기
	String uri=request.getParameter("uri");
	System.out.println(uri);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>홈페이지 로그인 페이지 입니다.</title>
<style>
	strong{
		color:red;
	}
	.loginForm{
		margin:100px 20px 100px 20px;
	}
	.btn-block{
		margin-top:5px;
	}
</style>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../ui/navbar.jsp">
	<jsp:param value="signIn" name="active"/>
</jsp:include>
	<div class="container">
		<div class="row">
			<div class=class="col-xs-12">
			<%--파라미터 uri값을 넘겨줘서 요청했던 페이지로 넘어가기 --%>
				<form action="signin.jsp?uri=<%=uri%>" method="post" class="loginForm">
					<h3><strong>로그인</strong></h3>
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" name="id" id="id"/>
						<p class="help-block">반드시 입력하세요</p>									
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호</label>
						<input type="password" class="form-control" name="pwd" id="pwd"/>
						<p class="help-block">반드시 입력하세요</p>					
					</div>				
					<div><button type="submit" class="btn btn-primary btn-block">로그인</button></div>
					<button type="reset" class="btn btn-danger btn-block">취소</button>
				</form>		
			</div>
		</div>	
	</div>	
</body>
</html>