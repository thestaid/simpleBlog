<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id=(String)session.getAttribute("id");
%>
<html>
<head>
<meta charset="UTF-8"/>
<title>게시판 글쓰기 페이지 입니다.</title>
<jsp:include page="../../ui/myResource.jsp"></jsp:include>
</head>
<style>
	strong{
		color:blue;
	}
	.insertForm{
		margin:100px 20px 100px 20px;
	}
	.btn-block{
		margin-top:5px;
	}
</style>
<body>
<jsp:include page="../../ui/navbar.jsp">
	<jsp:param value="board" name="active"/>
</jsp:include>
	<div class="container">
		<div class="row">
			<div class=class="col-xs-12">
				<form action="insert.jsp" post="method" class="insertForm">
					<h3><strong>글쓰기</strong></h3>
					<input type="hidden" name="writer" value="<%=id%>"/>									
					<div class="form-group">
						<label for="writer">작성자</label>
						<input type="text" class="form-control" name="writer" id="writer" value="<%=id%>" disabled="disabled"/>									
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<input type="text" class="form-control" name="title" id="title"/>
					</div>	
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" name="content" id="content" cols="50" rows="10"></textarea>					
					</div>
					<div class="row">
						<div class="col-xs-5"></div>
						<div class="col-xs-3">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-danger">취소</button>
							<a href="../board.jsp" class="btn btn-info">목록</a>						
						</div>
						<div class="col-xs-4"></div>
					</div>					
				</form>		
			</div>
		</div>	
	</div>
</body>
</html>