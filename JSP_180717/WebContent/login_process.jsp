<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	try {
		String jdbcDriver = "jdbc:apache:commons:dbcp:guestbook";
		conn = DriverManager.getConnection(jdbcDriver);
		sql = "select * from joindb where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
				
			if (pwd.equals(rs.getString("pwd")) && id.equals(rs.getString("id"))) {
				rs.getString("name");
				//세션 값 저장 
				session.setAttribute("id", id);
				session.setAttribute("pwd", pwd);
				session.setAttribute("name", name);
				
				  out.println("<script>");
				  out.println("location.href='index.jsp'");
				  out.println("</script>");
			} else {
				  out.println("<script>");
				  out.println("location.href='loginForm.jsp'");
				  out.println("</script>");
			}
		} else {
			out.println("<script>");
			  out.println("location.href='loginForm.jsp'");
			  out.println("</script>");
		}
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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 창</title>
<style>
</style>
</head>
<body>
</body>
</html>