<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 정보 확인</h2>
	<%
		Cookie[] cooks = request.getCookies(); //저장된 쿠키를 한 번에 불러오기(배열로)
	
		for(int i=0; i<cooks.length; i++) {
			if(cooks[i].getName().equals("id")){ //id만 가져오기
	%>
			<%= cooks[i].getName() %><br>
			<%= cooks[i].getValue() %><br>
	<%
			}
		}
	%>
	<hr>
	
	<!-- EL 내장객체 이용 -->
	${cookie.id.value }<br>
	${cookie.name.value }<br>
</body>
</html>