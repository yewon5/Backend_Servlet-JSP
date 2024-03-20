<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!-- 데이터 저장하기 위해 객체 생성 → bean에 저장 -->
<jsp:useBean id="dto" class="mybean.board.BoardDto" />

<jsp:setProperty property="*" name="dto" />

<!-- BoardDao.java - setBoard메서드를 호출하기 위한 객체 생성 -->
<jsp:useBean id="dao" class="mybean.board.BoardDao" />

	<%
		BoardDto original = dao.getBoard(dto.getB_num()); //Update.jsp에서 히든태그로 글번호를 넘겨줌
		

		if(dto.getB_pass().equals(original.getB_pass())) { //original.getB_pass()) 기존비번, dto.getB_pass() 수정시 입력한 비번
			dao.updateBoard(dto);
			response.sendRedirect("List.jsp"); //페이지 강제로 이동
		}
		else {
	%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
	<%
		}
	%>