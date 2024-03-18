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
		
 		//html에서 전달한 데이터 받아오기
		//폼태그에서 받아오기. 아이디는 수정불가라 안 받아옴
		String name = request.getParameter("e_name");
		String pass = request.getParameter("e_pass");
		String address = request.getParameter("e_address");
	 	//null 폼태그에는 사번을 넘겨주는 태그가 없어서 받아 올 수가 없음, 액션태그 주소/히든태그로 변수를 만들어줌
	 	String no = request.getParameter("e_no");
	 	
		//받아온 데이터를 DB에 저장하기
	 	Connection conn = null;
		PreparedStatement stmt = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111"); 
			
			
			//update문으로 바꿔보기
			String sql = "update tblEmp set e_name=?, e_pass=?, e_address=? where e_no=?";

			//stmt = conn.createStatement();
			stmt = conn.prepareStatement(sql);
			
			//숫자는 Primary Key 값 물음표의 순서. 값을 따로 보냄
			stmt.setString(1, name);
			stmt.setString(2, pass);
			stmt.setString(3, address);
			stmt.setString(4, no);
			
			stmt.executeUpdate();
	%>
		<script>
			alert("수정되었습니다.");
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