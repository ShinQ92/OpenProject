<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 메세지 삭제 확인</title>
<style>
</style>
</head>
<body>
	<form action="deleteMessage.jsp" method="post">
		<input type="hidden" name="messageId"
			value="${param.messageId}" /> 
			메시지를 삭제하시려면 암호를입력하세요:<br /> 
			암호: <input type="password" name="password" /> <br />
			 <input type="submit" value="메시지 삭제하기" />
	</form>
</body>
</html>