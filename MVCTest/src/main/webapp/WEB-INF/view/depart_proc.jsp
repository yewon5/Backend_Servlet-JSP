<%@page import="mybean.model.DepartmentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//서블릿으로부터 결과를 전달받고 보여주기만 한다. getAttribute("advice")호출하여 DepartmentServlet.java "advice"를 불러옴
	ArrayList<String> advice = (ArrayList)request.getAttribute("advice");
%>
	<!--3. 표현. 사용자에게 결과 보여주기 -->
	<h1>학과 선택에 따른 결과입니다.</h1>
	<%
		for(String s : advice){
	%>
			<div style="color:blue"><%=s %></div>
	<%		
		}
	%>

</body>
</html>