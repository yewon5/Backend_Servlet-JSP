<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] foods = {"뇨끼", "파스타", "쌀국수", "삼겹살", "짜파게티"};
		request.setAttribute("foods", foods);
	%>
	
	
	<%
		String[] arrFoods = (String[])request.getAttribute("foods");
		//for(int i=0; i<arrFoods.length; i++){
		for(String str : arrFoods){
	%>
			<!-- arrFoods[i] -->
			<%=str %><br>
	<%
		}
	%>
	<hr>
	<c:forEach begin="0" end="5" step="1" var="i">
		${foods[i] }<br>
	</c:forEach>
	<hr>
	
	<c:forEach var="str" items="${foods }">
		${str }<br>
	</c:forEach>
	<hr>
	
	<c:set var="guests" value="토끼/거북이*너구리-기린,강아지" />
	<!-- 반복문 + StringTokenizer -->
	<c:forTokens items="${guests }" delims="/*-," var="token">
		${token }<br>
	</c:forTokens>
	<hr>
	
	<!-- response.sendRedirect()  -->
	<c:redirect url="test4.jsp">
		<c:param name="name" value="연두부" />
		<c:param name="age" value="8세" />
	</c:redirect>
</body>
</html>