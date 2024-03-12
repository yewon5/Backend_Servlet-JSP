<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeExam2.jsp</title>
</head>
<body>
	<h2>session에 값 확인</h2>
	<%= session.getAttribute("i") %>
	<br><br>
	<h2>application에 값 확인</h2>
	<%= application.getAttribute("j") %><br>
	<%= application.getInitParameter("company") %>	
	<br><br>
	<h2>pageContext에 값 확인</h2>
	<%= pageContext.getAttribute("k") %><br>
	<%= pageContext.getAttribute("x", pageContext.APPLICATION_SCOPE) %><br>
</body>
</html>