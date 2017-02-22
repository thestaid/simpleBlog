<%@page import="board.dto.BoardDto"%>
<%@page import="board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	//원하는 게시내용 가져오는 기능
	BoardDto dto=BoardDao.getInstance().getData(num);
	String id=(String)session.getAttribute("id");
	//equals메소드 사용위해 임의의 쓰레기값 부여
	if(id==null){
		id="smdgnsngjsdgnskjdngsd;lgmslkdngksnglksndlkg";
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>게시글 페이지 입니다.</title>
<style>
	.division{
		text-align: center;
	}
	.content_margin{
		margin:100px 20px 100px 20px;
	}	
</style>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../ui/navbar.jsp">
	<jsp:param value="board" name="active"/>
	<jsp:param value="<%=num %>" name="num"/>
</jsp:include>
	<div class="container">
        <table class="table content_margin">
            <thead>
                <tr>
                    <th class="division">구분</th>
                    <th class="division">정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="division">번호</td>
                    <td><%=dto.getNum() %></td>
                </tr>            
                <tr>
                    <td class="division">작성자</td>
                    <td><%=dto.getWriter() %></td>
                </tr>
                <tr>
                    <td class="division">제목</td>
                    <td><%=dto.getTitle() %></td>
                </tr>
                <tr>
                    <td class="division">게시날짜</td>
                    <td><%=dto.getRegdate() %></td>
                </tr>
                <tr>
                    <td class="division">내용</td>
                    <td><%=dto.getContent() %></td>
                </tr>                
            </tbody>
        </table>			
		<div>
			<a href="board.jsp" class="btn btn-primary pull-right" style="margin-left:10px">목록</a>
			<a href="javascript:removeConfirm()" 
			<%-- 내가 작성한 글만 수정 삭제하는 기능 --%>
			<%if(id.equals(dto.getWriter())){ %>
				class="btn btn-danger pull-right" 
			<%}else{ %>
				class="btn btn-danger disabled pull-right"
			<%} %>style="margin-left:10px">삭제</a>
			<a href="board_op/updateform.jsp?num=<%=dto.getNum() %>" 
			<%if(id.equals(dto.getWriter())){ %>
				class="btn btn-warning pull-right"
			<%}else{ %>
				class="btn btn-warning disabled pull-right"
			<%} %>>수정</a>	
				
		</div>
	</div>
	<script>
	//삭제 여부 물어보고 삭제하는 기능
	function removeConfirm(){
		var isRemove=confirm("삭제하시겠습니까?");
		if(isRemove){
			location.href="board_op/delete.jsp?num=<%=dto.getNum() %>";
		}
	}
	</script>	
</body>
</html>