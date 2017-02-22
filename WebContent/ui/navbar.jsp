<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	//session에서 id 받아오기
	String id=(String)session.getAttribute("id");
	//요청 uri 담기
	String uri=request.getRequestURI();
	String contextPath=request.getContextPath();
	//파람값 받기
	String active=request.getParameter("active");
%>
<div class="row nav navbar-default">
	<div class="col-xs-3">
		<a href="<%=contextPath %>/home.jsp" class="navbar-brand">수현's 홈페이지</a>
	</div>
	<div class="col-xs-6">
		<ul class="nav navbar-nav">
			<li <%if(active.equals("home")){ %>class="active"<%} %>><a href="<%=contextPath %>/home.jsp">HOME</a></li>
			<li <%if(active.equals("board")){ %>class="active"<%} %>><a href="<%=contextPath %>/board/board.jsp">게시판</a></li>
			<%--id가 admin일때 admin tab보여주기 --%>
			<%if(id!=null&&id.equals("admin")){ %>
			<li <%if(active.equals("admin")){ %>class="active"<%} %>><a href="<%=contextPath %>/admin/list.jsp">관리페이지</a></li>
			<%}%>
		</ul>
	</div>
	<div class="col-xs-3 pull-right">
		<ul class="nav navbar-nav">
			<%--로그인 했을때 보여질  tab(회원정보, 로그아웃) --%>
			<%if(id!=null){ %>
				<li <%if(active.equals("info")){ %>class="active"<%} %>><a href="<%=contextPath %>/sign/info/info.jsp"><%=id %>님 접속중</a></li>
				<li <%if(active.equals("signOut")){ %>class="active"<%} %>><a href="<%=contextPath %>/sign/signout.jsp?uri=<%=uri%>">로그아웃</a></li>
			<%}%>
			<%--로그인 하지 않았을때  보여질tab(로그인, 회원가입) --%>
			<%if(id==null){ %>
				<li <%if(active.equals("signIn")){ %>class="active"<%} %>>
				<%if(uri.equals("/Homwork_SuHyeon_HomePage/board/postletter.jsp")){ 
					int num=Integer.parseInt(request.getParameter("num"));
				%>
					<a href="<%=contextPath %>/sign/signin_form.jsp?uri=<%=uri%>?num=<%=num%>">로그인</a>
				<%}else{ %>
					<a href="<%=contextPath %>/sign/signin_form.jsp?uri=<%=uri%>">로그인</a>
				<%} %>
				</li>
				<li <%if(active.equals("signUp")){ %>class="active"<%} %>>
				<%if(uri.equals("/Homwork_SuHyeon_HomePage/board/postletter.jsp")){ 
					int num=Integer.parseInt(request.getParameter("num"));
				%>
					<a href="<%=contextPath %>/sign/signup_form.jsp?uri=<%=uri%>?num=<%=num%>">회원가입</a>
				<%}else{ %>
					<a href="<%=contextPath %>/sign/signup_form.jsp?uri=<%=uri%>">회원가입</a>
				<%} %>			
				</li>			
			<%} %>			
		</ul>
	</div>
</div>
