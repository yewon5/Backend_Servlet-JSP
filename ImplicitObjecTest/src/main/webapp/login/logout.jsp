<% 
	//session.removeAttribute("id"); 아이디라는 변수만 삭제했을 뿐 세션의 공간은 남아있다.
	session.invalidate(); //세션 공간 삭제 로그아웃기능 메서드
	response.sendRedirect("index.jsp");
%>