<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
</body>
<%
	if(request.getMethod().equalsIgnoreCase("get")){ //getMethod 요청방식 확인, equalsIgnoreCase 대소문자 구분 없이
%>
	<!-- GET 방식으로 요청이 들어온 경우에 실행되는 부분 -->
	<form action="requestExam1.jsp" method="POST"> 
		이름 : <input type="text" name="name" /><br><br>
		주소 : <input type="text" name="addr" /><br><br>
		취미 : <br>
			<input type="checkbox" name="hobby" value="등산" />등산<br>
			<input type="checkbox" name="hobby" value="독서" />독서<br>
			<input type="checkbox" name="hobby" value="여행" />여행<br>
			<input type="checkbox" name="hobby" value="노래" />노래<br>
		<input type="submit" value="전송" />
	</form>
<%	
	} 
	else { //
%>	
	<!-- GET 방식이 아닌 경우에 실행되는 부분 -->
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
	%>
	당신의 이름은 <%= name %> 이고 주소는 <%= addr %> 입니다.
	
	<br><br>
	당신의 취미는 다음과 같습니다.<br>
	<ul>
		<%
			String[] hobbies = request.getParameterValues("hobby");
			if(hobbies != null){
				for(String hobby : hobbies){	
		%>
					<li><%= hobby %></li>
		<%
				}
			}
			else{
		%>
				<ul>선택한 내용이 없습니다.</ul>
		<%
			}
		%>
	</ul>
<%
	}
%>
</html>