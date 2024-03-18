<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteEmp.jsp 삭제된 값을 DB에 저장</title>
</head>
<body>
	<jsp:useBean id="dao" class="mybean.dao.EmployeeDao" />
	<jsp:setProperty property="deleteEmp" name="dao" param="e_no"/>

	<script>
		alert("삭제되었습니다.");
	</script>

	<ul>
		<li><a href="index.jsp">메인 페이지로</a></li>
		<li><a href="addEmp.html">추가 페이지로</a></li>
	</ul>
</body>
</html>