<%@page import="mybean.dto.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp - Bean</title>
	<script>
		function isDelete(e_no, e_id) {
			let result = confirm(e_id + "님을 정말 삭제하시겠습니까?"); //confirm은 Y/N 선택 박스
			
			if(result == true){
				location.href="deleteEmp.jsp?e_no=" + e_no;
			}
			
			return;
		}
	</script>
</head>
<jsp:useBean id ="dao" class="mybean.dao.EmployeeDao" />

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
	 	request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		String searchText = request.getParameter("searchText");
			
		try{
			ArrayList<Employee> list = dao.getList(keyword, searchText); //전달받은 매개변수 넣어주기
			
			for(Employee emp : list) { //list를 하나씩 꺼내서 emp에 저장. for(int i=0; i<list.size(); i++)
	%>
		<tr>
			<td><%=emp.getE_no() %></td>
			<td><%=emp.getE_id() %></td>
			<td><%=emp.getE_name() %></td>
			<td><%=emp.getE_pass() %></td>
			<td><%=emp.getE_address() %></td>
			<td><a href="updateEmp.jsp?e_no=<%=emp.getE_no() %>">수정</a></td> <!-- 사번을 파라미터로 전달 -->
			<!-- <td><a href="deleteEmp.jsp?e_no=<%=emp.getE_no() %>">삭제</a></td> 삭제를 누르면 바로 삭제되는데 <script>에서 팝업창이 뜨게 하는 것이 좋다. -->
			<td><a href="javascript:isDelete(<%=emp.getE_no() %>, '<%=emp.getE_id() %>')">삭제</a></td> <!-- JS함수 호출하는 코드 -->
		</tr>	
	<%	
			}
		}
		catch(Exception err){
			err.printStackTrace();
		}
	%>
	</table>
</body>
</html>