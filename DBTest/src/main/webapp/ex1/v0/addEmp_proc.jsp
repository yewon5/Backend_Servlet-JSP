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
	
		//addEmp.html에서 전달한 데이터 받아오기 (jsp에 저장하는 방식)
		String id = request.getParameter("e_id");
		String name = request.getParameter("e_name");
		String pass = request.getParameter("e_pass");
		String address = request.getParameter("e_address");
	 	
		//받아온 데이터를 DB에 저장하기
	 	Connection conn = null; //Connection 객체는 데이터베이스와의 연결을 나타냄.
		//Statement stmt = null; //명령어와 값을 직접 전달함
		PreparedStatement stmt = null; //명령어를 미리 준비해놓겠다.
	 	ResultSet rs = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111"); 
			
			//​DB에게 전달할 명령어
			/*
			//Statement 명령어와 값 직접 전달 방식
			String sql = "insert into tblEmp(e_no, e_id, e_name, e_pass," + 
				"e_address) values(seq_eno.nextVal, '" + id + "', '" + 
				name + "', '" + pass + "', '" + address + "')";
			*/
			
			
			//변수자리에 ? 사용으로 데이터는 나중에 보낼게. sql 명령어만 먼저 보낼테니 준비해놔. 
			String sql = "insert into tblEmp(e_no, e_id, e_name, e_pass," + 
					"e_address) values(seq_eno.nextVal, ?,?,?,?)";

			//stmt = conn.createStatement();
			stmt = conn.prepareStatement(sql);
			
			//숫자는 Primary Key 값 물음표의 순서. 값을 따로 보냄
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, pass);
			stmt.setString(4, address);
			
			stmt.executeUpdate();
	%>
		<script>
			alert("추가되었습니다.");
		</script>
	
		<ul>
			<li><a href="index.jsp">메인 페이지로</a></li>
			<li><a href="addEmp.html">추가 페이지로</a></li>
		</ul>
	<%
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(conn != null) conn.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
		}
	%>
</body>
</html>