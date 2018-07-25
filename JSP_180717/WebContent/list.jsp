<%@page import="guestbook.model.Message"%>
<%@page import="guestbook.model.MessageListView"%>
<%@page import="guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    	<%if(session.getAttribute("id") == null) {%>
 <%out.println("<script>alert('로그인후 이용해주세요')</script>");
 out.println("<script>location.href = 'index.jsp'</script>");

 %>
<%}%> 
<%
	request.setCharacterEncoding("UTF-8");

	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GuestBook</title>
<style>
</style>
</head>
<body>
<button type="button" ><a href="writeForm.jsp" style='text-decoration:none'>글쓰기</a></button>
<button type="button" ><a href="index.jsp" style='text-decoration:none'>홈으로</a></button>


	<hr>
	<%
		if (viewData.isEmpty()) {
	%>
	<h1>등록된 메시지가 없습니다.</h1>
	<%
		} else {
	%>
	<table border="1">
		<%
			for (Message message : viewData.getMessageList()) {
		%>
		<tr>
			<td>메시지 번호: <%=message.getId()%><br /> 이름:  <%=message.getGuestName()%><br />
				메시지: <%=message.getMessage()%> <br /> <a
				href="confirmDeletion.jsp?messageId=<%=message.getId()%>">[삭제하기]</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>

	전체 페이지 카운트
	<%=viewData.getPageTotalCount()%>
	<br>
	<%
		for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
	%>
	<a href="list.jsp?page=<%=i%>">[<%=i%>]
	</a>

	<%
		}
		}
	%>
</body>
</html>

