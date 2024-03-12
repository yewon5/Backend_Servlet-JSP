<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam1.jsp</h1>
	<% //값 저장
		request.setAttribute("first", "request 객체");
		session.setAttribute("first", "session 객체");
		application.setAttribute("first", "application 객체");
		pageContext.setAttribute("first", "pageContext 객체");
	%> 
	request : <%=request.getAttribute("first") %><br>
	session : <%=session.getAttribute("first") %><br>
	application : <%=application.getAttribute("first") %><br>
	pageContext : <%=pageContext.getAttribute("first") %><br>
	<hr>
	
	<!-- Action Tag : exam2로 요청에 의한 페이지 이동이라서 request 값도 포함해서 다시 리턴 -->
	<jsp:include page="exam2.jsp"></jsp:include>
	
	<!-- 지시자 -->
	<%//@include file="exam2.jsp" %>
	
	<hr>
	request : <%=request.getAttribute("second") %><br>
	session : <%=session.getAttribute("second") %><br>
	application : <%=application.getAttribute("second") %><br>
	pageContext : <%=pageContext.getAttribute("second") %><br>
</body>
</html>
