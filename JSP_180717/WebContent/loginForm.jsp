<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
</style>
</head>
<body>
	<div id="main">
		<h1>NAVER</h1>
	</div>
	<form action="login_process.jsp">
		<div id=login>
			<div id="inputId">
				<input type="text" placeholder="아이디" name="id">
			</div>
			<div id="inputpwd">
				<input type="password" placeholder="비밀번호" name="pwd">
			</div>
			<input type="submit" value="로그인">
		</div>
	</form>
	<div id="loginopt">
		<input type="radio">로그인 상태유지 <a>IP보안</a> <a>ON</a> <a>일회용
			로그인</a>
	</div>

	<div id=footer>
		<a>아이디 찾기</a> <a>비밀번호 찾기</a> <a>회원가입</a>
	</div>
</body>
</html>