<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam2.jsp</h1>
	request : <%=request.getAttribute("first") %><br>
	session : <%=session.getAttribute("first") %><br> <!-- 값 유지 -->
	application : <%=application.getAttribute("first") %><br> <!-- 값 유지 -->
	pageContext : <%=pageContext.getAttribute("first") %><br>
	
	<% //값 저장
		request.setAttribute("second", "request 객체");
		session.setAttribute("second", "session 객체");
		application.setAttribute("second", "application 객체");
		pageContext.setAttribute("second", "pageContext 객체");
	%> 
</body>
</html>