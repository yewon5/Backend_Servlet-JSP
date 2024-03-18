<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateEmp_proc.jsp 수정된 값을 DB에 저장</title>
</head>
<body>	
	<%
	 	request.setCharacterEncoding("utf-8");
	%>
	<!-- 데이터 저장하기 위해 객체 생성 → bean에 저장 -->
	<jsp:useBean id="dto" class="mybean.dto.Employee" />
	<jsp:setProperty property="*" name="dto" />

	<!-- 저장한 데이터 updateEmp 호출하여 전달하기 -->
	<jsp:useBean id="dao" class="mybean.dao.EmployeeDao" />	
	<%
		dao.updateEmp(dto); //updateEmp 호출하여 id="dto"를 매개변수로 전달하여 데이터 저장
	%>

	<script>
		alert("수정되었습니다.");
	</script>

	<ul>
		<li><a href="index.jsp">메인 페이지로</a></li>
		<li><a href="addEmp.html">추가 페이지로</a></li>
	</ul>

</body>
</html>