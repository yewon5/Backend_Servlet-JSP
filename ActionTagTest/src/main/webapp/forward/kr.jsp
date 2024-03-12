<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>저희 사이트를 접속해주셔서 감사합니다.</h2>
	당신이 등록한 데이터는 다음과 같습니다.<br>
	<ul>
		<li>이름 : <%=request.getParameter("name") %></li>
		<li>주소 : <%=request.getParameter("addr") %></li>
		<li>언어 : <%=request.getParameter("lang") %></li>
	</ul>
</body>
</html>