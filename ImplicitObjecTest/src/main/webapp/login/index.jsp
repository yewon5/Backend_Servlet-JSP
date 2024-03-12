<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<% 
	//HttpSession 객체의 getAttribute 메서드는 세션에 저장된 데이터를 Object 타입으로 반환
	//getAttribute Object 타입이라서 문자열과 관련된 메서드나 속성을 사용할 수 없다.
	String id = (String)session.getAttribute("id"); 
	if(id != null) { //세션에 id값이 저장되어있으면 통과 (login_proc.jsp 9번)
%>
	<h2><%= id %>님 방문을 환영합니다😄</h2>
	<ul>
		<a href="shop.jsp">쇼핑몰</a><br><br>
		<a href="logout.jsp">로그아웃</a>
	</ul>
<%
	} else {
%>
	<h2>환영합니다! 로그인을 해주세요😄</h2>
	<ul>
		<a href="login.jsp?menu=index">로그인</a><br><br>
		<a href="shop.jsp">쇼핑몰</a><br><br>
	</ul>
<%
	}
%>
</body>
</html>