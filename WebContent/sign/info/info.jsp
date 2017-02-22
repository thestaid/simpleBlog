<%@page import="users.dto.UsersDto"%>
<%@page import="users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	//회원 정보 한사람것 들고오기
	UsersDto dto=UsersDao.getInstance().getData(id);
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>회원정보 입니다.</title>
<style>
	.division{
		text-align: center;
	}
	.infoForm{
		margin:100px 20px 100px 20px;
	}
</style>
<jsp:include page="../../ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../ui/navbar.jsp">
	<jsp:param value="info" name="active"/>
</jsp:include>
	<div class="container">
		<div class="row infoForm">
			<div class="col-xs-6 col-xs-offset-3">
 				<h3><strong><%=session.getAttribute("id") %>님의 회원 정보</strong></h3>
                <table class="table table-bordered table-condensed">
                    <thead>
                        <tr>
                            <th class="division">구분</th>
                            <th class="division">정보</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="division">아이디</td>
                            <td><%=dto.getId() %></td>
                        </tr>
                        <tr>
                            <td class="division">이메일</td>
                            <td><%=dto.getEmail() %></td>
                        </tr>
                        <tr>
                            <td class="division">가입일</td>
                            <td><%=dto.getRegdate() %></td>
                        </tr>
                    </tbody>
                </table>			
                <%--수정 버튼을 누르면 id파라미터 값을 들고간다. --%>
				<a href="updateform.jsp?id=<%=dto.getId() %>" class="btn btn-warning btn-block">수정</a>
				<%--탈퇴 버튼누르면 스크립트 문으로 넘어간다. --%>
				<a href="javascript:removeConfirm()" class="btn btn-danger btn-block">삭제</a>		
			</div>
		</div>	
	</div>
	<script>
	//탈퇴시 확인을 물어봐서 탈퇴여부를 물어보고 탈퇴 시킨다.
	function removeConfirm(){
		var isRemove=confirm("탈퇴하시겠습니까?");
		if(isRemove){
			location.href="delete.jsp";
		}
	}
	</script>
</body>
</html>