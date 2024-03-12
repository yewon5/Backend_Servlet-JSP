<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% int i = 100; %>
	
	<!-- 오류 : Duplicate local variable i, 지시자는 두 페이지를 하나로 만들기때문에 i라는 똑같은 변수를 선언할 수 없다. -->
	<%//@include file="header.jsp" %>
	<jsp:include page="header.jsp" /> 
	<h2>exam5.jsp</h2>
	<%@include file="footer.jsp" %>
</body>
</html>