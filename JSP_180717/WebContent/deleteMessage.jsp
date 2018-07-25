<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="guestbook.service.DeleteMessageService"%>
<%@ page import="guestbook.service.InvalidMessagePassowrdException"%>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	String guestName = request.getParameter("guestName");
	boolean invalidPassowrd = false;
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, password);
	} catch (InvalidMessagePassowrdException ex) {
		invalidPassowrd = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 삭제</title>
<style>
</style>
</head>
<body>
	<%
		if (!invalidPassowrd) {
	%>
	메시지를 삭제하였습니다.
	<%
		} else {
	%>
	입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
	<%
		}
	%> 
	<%
		if (!invalidPassowrd) {
	%>
	메시지를 삭제하였습니다.
	<%
		} else {
	%>
	입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
	<%
		}
	%> 
	<br />
	<a href="list.jsp">[목록 보기]</a>
</body>

</html>