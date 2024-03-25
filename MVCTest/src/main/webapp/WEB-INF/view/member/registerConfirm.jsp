<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mybean.model.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<jsp:useBean id="dto" class="mybean.model.Member" />
<% dto = (Member)request.getAttribute("dto"); %>
<body>
	<h1>회원 가입 확인</h1>
	<form action="/MVCTest/mem?command=complete" method="post">
		님이 입력한 내용은 다은과 같습니다.<br>
		<ul>
			<li>아이디 : <%=dto.getId() %> </li>
			<li>패스워드 : <%=dto.getPw() %> </li>
			<li>이메일 : <%=dto.getEmail() %> </li>
		</ul>
		
		<input type="submit" value="가입 완료" /> &nbsp;&nbsp;&nbsp;
		<input type="button" value="뒤로" />		
	</form>
</body>
</html>