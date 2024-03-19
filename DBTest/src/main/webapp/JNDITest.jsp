<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JNDI 테스트</title>
</head>
<body>
	<%
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/EmployeeDB"); // "comp/env/" 여기까지 기본 이름, 그뒤로 만든 이름. 리소스 type이 DataSource라서 캐스팅을 해준다.
		
		Connection conn = ds.getConnection();
		
		if(conn != null) {
			out.println("<h2>연결 성공</h2>");
		}
	%>
</body>
</html>