<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	접근 방식 : <%= request.getMethod() %><br>
	EL 접근 방식 : ${pageContext.request.method }<br>
	<hr>

	세션 만료 시간 : <%= session.getMaxInactiveInterval() %><br>
	EL 세션 만료 시간 : ${pageContext.session.maxInactiveInterval }
</body>
</html>