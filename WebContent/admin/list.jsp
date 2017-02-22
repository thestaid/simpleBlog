<%@page import="users.dto.UsersDto"%>
<%@page import="java.util.List"%>
<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<UsersDto> list=UsersDao.getInstance().getList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>관리자 페이지입니다.</title>
<style>
	.division{
		text-align: center;
	}
	.listForm{
		margin:100px 20px 100px 20px;
	}	
</style>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../ui/navbar.jsp">
	<jsp:param value="admin" name="active"/>
</jsp:include>
	<div class="container">
		<div class="table table-hover listForm">
			<h3><strong>관리자페이지 입니다.</strong></h3>
			<h5>사이트에 가입한 회원 목록입니다.</h5>
            <table class="table table-hover">
                  <thead>
                  	<tr>
                  		<th class="division">번호</th>
                  		<th class="division">이메일</th>
                  		<th class="division">가입날짜</th>
                  		<th class="division">탈퇴</th>
                  	</tr>
                  </thead>
                  <tbody>
                  <%--삭제버튼에 각각의 id값을 부여해서 동작을 다르게 한다. --%>
                  <%for(UsersDto tmp:list){ %>
                  	<tr>
                  		<td class="division"><%=tmp.getId() %></td>
                  		<td class="division"><%=tmp.getEmail() %></td>
                  		<td class="division"><%=tmp.getRegdate() %></td>
                  		<td class="division"><a href="javascript:removeConfirm<%=tmp.getId()%>()" class="btn btn-danger">삭제</a></td>
                  	</tr>
                  	<%--삭제시 물어보고 삭제 --%>
					<script>
					function removeConfirm<%=tmp.getId()%>(){
						var isRemove=confirm("삭제하시겠습니까?");
						if(isRemove){
							location.href="delete.jsp?id=<%=tmp.getId() %>";
						}
					}
					</script>              
					<%} %>   	
                  </tbody>
            </table>			
		</div>
	</div>
</body>
</html>