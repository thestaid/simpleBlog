<%@page import="board.dto.BoardDto"%>
<%@page import="board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String id=(String)session.getAttribute("id");
	int num=Integer.parseInt(request.getParameter("num"));
	//게시글 데이터 가져오는 기능
	BoardDto dto=BoardDao.getInstance().getData(num);
	String uri=request.getRequestURI();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>글 수정 페이지 입니다.</title>
<jsp:include page="../../ui/myResource.jsp"></jsp:include>
</head>
<style>
	strong{
		color:green;
	}
	.updateForm{
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
				<form action="update.jsp" post="method" class="updateForm">
					<h3><strong>수정 페이지</strong></h3>
					<input type="hidden" name="num" value="<%=dto.getNum()%>"/>									
					<div class="form-group">
						<label for="num">번호</label>
						<input type="text" class="form-control" name="num" id="num" value="<%=dto.getNum()%>" disabled="disabled"/>									
					</div>
					<input type="hidden" name="writer" value="<%=dto.getWriter()%>"/>									
					<div class="form-group">
						<label for="writer">작성자</label>
						<input type="text" class="form-control" name="writer" id="writer" value="<%=dto.getWriter()%>" disabled="disabled"/>									
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<input type="text" class="form-control" name="title" id="title" value="<%=dto.getTitle()%>"/>
					</div>
					<input type="hidden" name="regdate" value="<%=dto.getRegdate()%>"/>
					<div class="form-group">
						<label for="regdate">작성날짜</label>
						<input type="text" class="form-control" name="regdate" id="regdate" value="<%=dto.getRegdate()%>" disabled="disabled"/>
					</div>						
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" name="content" id="content" cols="50" rows="10"><%=dto.getContent() %></textarea>					
					</div>
					<div class="row">
						<div class="col-xs-5"></div>
						<div class="col-xs-3">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="reset" class="btn btn-danger">취소</button>						
						</div>
						<div class="col-xs-4"></div>
					</div>					
				</form>		
			</div>
		</div>	
	</div>
</body>
</html>