<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!-- 데이터 저장하기 위해 객체 생성 → bean에 저장 -->
<jsp:useBean id="dto" class="mybean.board.BoardDto" />

<!-- 입력한 파라미터 dto에 저장 -->
<jsp:setProperty property="*" name="dto" />

<!-- BoardDao.java - replyBoard메서드를 호출하기 위한 객체 생성 -->
<jsp:useBean id="dao" class="mybean.board.BoardDao" />	
	<%
		dao.replyBoard(dto); //replyBoard 호출하여 매개변수로 전달하여 데이터 저장
		response.sendRedirect("List.jsp"); //페이지 강제로 이동
	%>