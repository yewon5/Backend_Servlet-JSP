<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopeExam1.jsp</title>
</head>
<body>
	<h2>session에 값 저장</h2>
	<%
		session.setAttribute("i", 10);
	%>
	<br><br>
	
	<h2>application에 값 저장</h2>
	<%
		application.setAttribute("j", 100);
	%>
	<br><br>
	
	<h2>pageContext에 값 저장</h2>
	<%
		pageContext.setAttribute("k", 1000);
	%>
	<br><br>
	
	<h2>pageContext를 이용해서 application에 값을 저장</h2>
	<%
		pageContext.setAttribute("x", 5000, pageContext.APPLICATION_SCOPE);
	%>
</body>
</html>