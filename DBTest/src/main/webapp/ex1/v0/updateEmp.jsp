<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateEmp.jsp 수정 페이지</title>
</head>
	<%
		String e_no = request.getParameter("e_no");
		String e_id = null, e_name = null, e_pass = null, e_address = null;

		Connection conn = null; //Connection 객체는 데이터베이스와의 연결을 나타냄.
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111"); 
			
			//수정하려는 데이터만 가져오기 e_no 검색, e_no Primary Key
			//PreparedStatement 바꿔보기​
			String sql = "select * from tblEmp where e_no=" + e_no;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql); //검색 값 rs에 저장. DB 접속이 끊어지면 메모리도 사라짐
			
			//데이터가 있을때만 
			if(rs.next()) { 
				//변수에 값 저장
				e_id = rs.getString("e_id");
				e_name = rs.getString("e_name");
				e_pass = rs.getString("e_pass");
				e_address = rs.getString("e_address");
			}
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(conn != null) conn.close(); //conn이 null이 아닐때만 close할수있도록
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
		}
	%>
	</table>
<body>
	<h1>직원 수정</h1>
	<form action="updateEmp_proc.jsp?e_no=<%=e_no%>" method="post"> <!--  페이지 주소 뒤에 ?e_no=<%=e_no%> 변수를 선언해서 값을 넘겨주거나 -->
		<input type="hidden" name="e_no" value="<%=e_no%>" /> <!-- 깔끔하게 히든태그를 이용해도 된다. -->
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="e_id" value="<%=e_id%>" readonly/></td> <!-- readonly 수정불가 -->
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="e_name" value="<%=e_name%>"/></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="e_pass" value="<%=e_pass%>"/></td>
			</tr>
			<tr>
				<th>근무지</th>
				<td>
					<select name="e_address">
						<option <% if(e_address.equals("서울")) { %> selected <% } %>>서울</option>
						<option <% if(e_address.equals("광주")) { %> selected <% } %>>광주</option>
						<option <% if(e_address.equals("부산")) { %> selected <% } %>>부산</option>
						<option <% if(e_address.equals("제주")) { %> selected <% } %>>제주</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송"/>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>