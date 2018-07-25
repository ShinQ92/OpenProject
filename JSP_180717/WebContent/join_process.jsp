<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		String jdbcDriver = "jdbc:apache:commons:dbcp:guestbook";
		conn = DriverManager.getConnection(jdbcDriver);
		pstmt = conn.prepareStatement("insert into JOINDB values (?, ?, ?, ?, ?, ?)");
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, birth);
		pstmt.setString(5, email);
		pstmt.setString(6, phone);

		pstmt.executeUpdate();
	} finally {
		
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<h1>회원가입이 완료되었습니다</h1>
	<a href="loginForm.jsp">로그인하러가기</a>
</body>
</html>