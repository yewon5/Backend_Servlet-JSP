<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<!-- login_proc.jsp를 따로 만들지 않고 login.jsp에 코드 넣기 -->
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String menu = request.getParameter("menu"); //쇼핑몰을 눌러서 로그인 성공시 쇼핑몰페이지 유지
	
	if("won".equals(id) && "1234".equals(pw)){ //id pw 인증처리
		session.setAttribute("id", id); //아이디 인증확인
		
		if(menu.equals("shop")) //로그인 성공시 shop
			response.sendRedirect("shop.jsp"); 
		else
			response.sendRedirect("index.jsp");
}
//else{ 재귀호출로 삭제해준다.
//response.sendRedirect("login.jsp"); //로그인 실패시 로그인페이지로
//}
%>

<body>
	<fieldset>
	<legend> LOGIN </legend>
	<form action="login.jsp" method="post">
		아이디 : <input type="text" name="id" required="required"/><br><br>
		패스워드 : <input type="password" name="pw" required="required"/><br><br>
		<input type="hidden" name="menu" value="<%= menu %>" /> <!-- 화면에는 보이지 않지만 서버에 전달 -->
		<input type="submit" value="로그인"/>
		<input type="reset" value="취소"/>
	</form>
	</fieldset>
</body>
</html>