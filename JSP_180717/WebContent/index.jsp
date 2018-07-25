<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<a href="agreeForm.jsp">회원가입</a>
	<a href="joinView.jsp">마이페이지</a>
	<a href="loginForm.jsp">로그인</a>
	<a href="list.jsp">게시판<br></a>
	<a href="logout_Process.jsp">로그아웃<br></a>
	<%if(session.getAttribute("id") != null) {%>
 <%=session.getAttribute("id")%> <%out.println("님 반갑습니다");%><br>
<%}%> 
</body>
</html>