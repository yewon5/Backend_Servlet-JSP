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
	<%
	 	request.setCharacterEncoding("utf-8");
		
 		//html에서 전달한 데이터 받아오기
	 	String no = request.getParameter("e_no");
	 	
		//받아온 데이터를 DB에 저장하기
	 	Connection conn = null;
		PreparedStatement stmt = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111"); 
			
			//delete문으로 바꿔보기
			String sql = "delete from tblEmp where e_no=?";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, no);
			
			stmt.executeUpdate();
	%>
		<script>
			alert("삭제되었습니다.");
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
		}
	%>
</body>
</html>