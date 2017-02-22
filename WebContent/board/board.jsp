<%@page import="board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	//임의의 값을 줘서 equals 기능 사용
	if(id==null){
		id="skndglksndglnsdlkgnlsdlgksdnglskldngklslkdgnkldsng";
	}
	//게시판 정보 가져오는 기능
	List<BoardDto> list=BoardDao.getInstance().getList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>게시판 페이지 입니다.</title>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
</head>
<style>
	.division{
		text-align: center;
	}
	.board{
		margin:100px 20px 100px 20px;
	}	
</style>
<body>
<jsp:include page="../ui/navbar.jsp">
	<jsp:param value="board" name="active"/>
</jsp:include>
	<div class="container">
		<div class="table table-hover board">
			<h3><strong>게시판</strong></h3>
            <table class="table table-hover">
                  <thead>
                  	<tr>
                  		<th class="division">번호</th>
                  		<th class="division">제목</th>
                  		<th class="division">작성자</th>
                  		<th class="division">작성날짜</th>
                  		<th class="division">수정</th>
                  		<th class="division">삭제</th>
                  	</tr>
                  </thead>
                  <tbody>
                  <%for(BoardDto tmp:list){ %>
                  	<tr>
                  		<td class="division"><%=tmp.getNum() %></td>
                  		<td class="division"><a href="postletter.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
                  		<td class="division"><%=tmp.getWriter() %></td>
                  		<td class="division"><%=tmp.getRegdate() %></td>
                  		<td class="division"><a href="board_op/updateform.jsp?num=<%=tmp.getNum() %>" 
                  		<%-- 수정, 삭제 버튼 session에 저장된 id값과 일치하지 않으면 막아놓는 기능 --%>
                  		<%if(id.equals(tmp.getWriter())){ %>
                  			class="btn btn-warning"
						<%}else{%>
						    class="btn btn-warning disabled"
                  		<%} %>>수정</a></td>
                  		<td class="division"><a href="javascript:removeConfirm<%=tmp.getNum()%>()"
						<%if(id.equals(tmp.getWriter())){ %>
							class="btn btn-danger"
						<%}else{%>
							class="btn btn-danger disabled"
						<%} %>>삭제</a></td>
                  		
                  	</tr>
                  	<%-- 삭제 여부 물어보는 기능(각각의 삭제버튼마다 다른 값을 부여) --%>
					<script>
					function removeConfirm<%=tmp.getNum()%>(){
						var isRemove=confirm("삭제하시겠습니까?");
						if(isRemove){
							location.href="board_op/delete.jsp?num=<%=tmp.getNum() %>";
						}
					}
					</script>                 	
                  <%} %>
                  </tbody>
            </table>			
			<a href="board_op/insertForm.jsp" class="btn btn-info pull-left">글쓰기</a>	
		</div>
	</div>		
</body>
</html>