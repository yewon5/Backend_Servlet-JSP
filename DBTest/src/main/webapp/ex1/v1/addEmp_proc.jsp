<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 	request.setCharacterEncoding("utf-8");
	%>
	<!-- Bean에 저장하는 방식 / jsp는 request.getParameter로 저장-->
	<jsp:useBean id="dto" class="mybean.dto.Employee" />
	<jsp:setProperty property="*" name="dto"/>

	<!-- setEmp 호출하기위해 객체 생성 -->
	<jsp:useBean id="dao" class="mybean.dao.EmployeeDao" />	
	<%
		dao.setEmp(dto); //값이 여러개라서 액션태그 사용 불가. 자바코드로 작성해준다.
	%>
	
		<script>
			alert("추가되었습니다.");
		</script>
	
		<ul>
			<li><a href="index.jsp">메인 페이지로</a></li>
			<li><a href="addEmp.html">추가 페이지로</a></li>
		</ul>

</body>
</html>