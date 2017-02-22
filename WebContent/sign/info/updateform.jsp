<%@page import="users.dto.UsersDto"%>
<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 id를 읽어온다.
	String id=(String)session.getAttribute("id");
	//회원정보 얻어와서 한번 뿌려주기
	UsersDto dto=UsersDao.getInstance().getData(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>회원 정보 수정페이지입니다.</title>
<style>
	strong{
		color:red;
	}
	#updateForm{
		margin:100px 20px 100px 20px;
	}
	.btn-block{
		margin-top:5px;
	}
</style>
<jsp:include page="../../ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../ui/navbar.jsp">
	<jsp:param value="info" name="active"/>
</jsp:include>
	<div class="container">
		<div class="row">
			<div class=class="col-xs-12">
				<form action="update.jsp" method="post" id="updateForm">
					<h3><strong>회원 정보 수정</strong></h3>
					<div class="form-group">
						<input type="hidden" class="form-control" name="id" value="<%=dto.getId()%>"/>
					</div>
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" name="id" id="id" disabled="disabled" value="<%=dto.getId()%>"/>							
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호</label>
						<input type="password" class="form-control" name="pwd" id="pwd" value="<%=dto.getPwd()%>"/>				
					</div>	
					<div class="form-group">
						<label for="pwd2">비밀번호 확인</label>
						<input type="password" class="form-control" name="pwd2" id="pwd2" value="<%=dto.getPwd()%>"/>				
					</div>	
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="text" class="form-control" name="email" id="email" value="<%=dto.getEmail()%>"/>				
					</div>														
					<button type="submit" class="btn btn-primary btn-block">수정</button>
					<button type="reset" class="btn btn-danger btn-block">취소</button>
				</form>		
			</div>
		</div>	
	</div>	
	<script>
		//비번이 다르면 폼 전송 막기
		$("#updateForm").on("submit",function(event){
			var pwd=$("#pwd").val();
			var pwd2=$("#pwd2").val();
			if(pwd != pwd2){
				alert("비밀번호를 확인 하세요");
				event.preventDefault(); 
			}			
		});
	</script>
</body>
</html>