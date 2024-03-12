<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Thank you for visiting our website.</h2>
	The data you entered is as follows.<br>
	<ul>
		<li>name : <%=request.getParameter("name") %></li>
		<li>address : <%=request.getParameter("addr") %></li>
		<li>language : <%=request.getParameter("lang") %></li>
	</ul>
</body>
</html>