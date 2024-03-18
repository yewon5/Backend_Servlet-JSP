<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp - Bean</title>
	<script>
		function isDelete(e_no, e_name) {
			let result = confirm(e_name + "님을 정말 삭제하시겠습니까?"); //confirm은 Y/N 선택 박스
			
			if(result == true){
				location.href="deleteEmp.jsp?e_no=" + e_no;
			}
			
			return;
		}
	</script>
</head>
<body>
	<h1>직원 정보</h1>
	<a href="addEmp.html">직원 추가</a>
	<br><br>
	<form action="index.jsp" method="post">
		<select name="keyword">
	        <option value="e_id">아이디</option> <!-- value 속성이 서버로 전달됨 -->
	        <option value="e_name">이름</option>
	        <option value="e_address">주소</option>
		</select>
		<input type="text" name="searchText" />
		<input type="submit" value="검색" /> <!-- submit → value 중 하나가 선택됨 → searchText -->
	</form><br>
	<table border="1">
		<tr>
			<th>사번</th><th>ID</th><th>이름</th><th>패스워드</th><th>주소</th><th>수정</th><th>삭제</th>
		</tr>
	
	<%
		Connection conn = null; //Connection 객체는 데이터베이스와의 연결을 나타냄.
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
	 	request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		String searchText = request.getParameter("searchText");
		
		try{
			if(searchText.isEmpty()) { //if문 : 검색어를 입력하지 않았을 때. 하지만 이미 null값을 갖고 있는 상태에서 비교를 하기때문에 Null오류가 뜬다. try로 예외처리 해준다.
				sql = "select * from tblEmp order by e_no";
			} else {
				sql = "select * from tblEmp where " + keyword + " like '%" + searchText + "%'";
			}
		}
		catch(NullPointerException err){
			sql = "select * from tblEmp order by e_no";
		}
			
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111"); 
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql); 
			while(rs.next()){ //커서를 한 줄 밑으로 내림. rs에 저장된 DB의 첫번째 행은 제목이라서 한칸 밑으로 내려줘야 첫번째 데이터를 불러올 수 있다.
	%>
		<tr>
			<td><%=rs.getInt("e_no") %></td>
			<td><%=rs.getString("e_id") %></td>
			<td><%=rs.getString("e_name") %></td>
			<td><%=rs.getString("e_pass") %></td>
			<td><%=rs.getString("e_address") %></td>
			<td><a href="updateEmp.jsp?e_no=<%=rs.getInt("e_no") %>">수정</a></td> <!-- 사번을 파라미터로 전달 -->
			<!-- <td><a href="deleteEmp.jsp?e_no=<%=rs.getInt("e_no") %>">삭제</a></td> 삭제를 누르면 바로 삭제되는데 <script>에서 팝업창이 뜨게 하는 것이 좋다. -->
			<td><a href="javascript:isDelete(<%=rs.getInt("e_no") %>, '<%=rs.getString("e_name") %>')">삭제</a></td> <!-- JS함수 호출하는 코드 -->
		</tr>	
	<%	
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
</body>
</html>