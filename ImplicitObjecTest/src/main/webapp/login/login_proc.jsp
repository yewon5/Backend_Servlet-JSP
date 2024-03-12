<%@ page contentType="text/html; charset=UTF-8" %>
<!-- java코드만 작성하는 것이라 기본코드는 필요 없다. -->

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("won") && pw.equals("1234")){ //id pw 인증처리
		session.setAttribute("id", id); //아이디 인증확인
		response.sendRedirect("index.jsp"); //로그인 성공시 메인페이지로
	}
	else{
	response.sendRedirect("login.jsp"); //로그인 실패시 로그인페이지로
	}
%>