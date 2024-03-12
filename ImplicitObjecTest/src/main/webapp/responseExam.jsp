<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseExam.jsp</title>
</head>
<body>
	1. 다른페이지로 이동
	<%
		//response.sendRedirect("https://www.naver.com");
		//response.sendRedirect("requestExam1.html");
	%>
	<br><br>
	
	2. 선택에 의해 페이지 이동
	<%
		String param = request.getParameter("param");
		if(param == null || param.isEmpty()){
	%>
			페이지를 이동을 하지 않습니다.
	<%
		}
		else{
			response.sendRedirect("requestExam1.html");
		}
	%>
</body>
</html>