<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam2.jsp</h1>
	irum : <%= request.getParameter("irum") %>
	
	<!-- 1에서 전달 받은 데이터를 다시 3에게 전달 forward 사용하는 순간 시작페이지가 된다.-->
	<%-- <jsp:forward page="exam3.jsp"></jsp:forward> --%>
	
	<!-- java 코드로 구현 -->
	<%
		RequestDispatcher dispatcher = request.getRequestDispatcher("/forward/exam3.jsp");
		dispatcher.forward(request, response);
	%>
</body>
</html>