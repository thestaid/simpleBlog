<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath=request.getContextPath();
	String uri=request.getParameter("uri");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>회원가입 폼입니다.</title>
<style>
	strong{
		color:blue;
	}
	.signupForm{
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
	<jsp:param value="signUp" name="active"/>
</jsp:include>
	<div class="container">
		<div class="row">
			<div class=class="col-xs-12">
			<%--회원가입하면 원래 요청한 페이지의 uri값을 파라미터로 들고간다. --%>
				<form action="signup.jsp?uri=<%=uri%>" method="post" class="signupForm">
					<h3><strong>회원가입</strong></h3>
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
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="text" class="form-control" name="email" id="email"/><br/>					
					</div>					
					<div><button type="submit" class="btn btn-primary btn-block">가입</button></div>
					<button type="reset" class="btn btn-danger btn-block">취소</button>
				</form>		
			</div>
		</div>	
	</div>
</body>
</html>