<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰페이지</title>
</head>
<body>
<body>
<%
	String id = (String)session.getAttribute("id");
	if(id != null){ 
%>
	<h2><%= id %>님 즐거운 쇼핑 되세요🛒</h2>
	<ul>
		<a href="index.jsp">메인페이지</a><br><br>
		<a href="logout.jsp">로그아웃</a>
	</ul>
	
<% 
	} else { 
		response.sendRedirect("login.jsp?menu=shop"); //id가 틀리면 menu 변수를 들고 로그인페이지로 이동
	}
%>
</body>
</body>
</html>