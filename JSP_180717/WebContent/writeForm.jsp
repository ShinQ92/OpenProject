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
	<form action="writeMessage.jsp" method="post">
		이름:  <%=session.getAttribute("id")%>
		<input type="hidden" name="guestName" cols="30" row="3" value="<%=session.getAttribute("id")%>"> <br>
		<input type="hidden" name="password" cols="30" row="3" value="<%=session.getAttribute("pwd")%>"> <br>
		 메시지:
		<textarea name="message" cols="30" row="3"></textarea>
		<br> <input type="submit" value="메시지 남기기" />
		<br> <button type="button"><a href="index.jsp" style='text-decoration:none;'>홈으로</a></button>
	</form>
</body>
</html>