<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!-- 데이터 저장하기 위해 객체 생성 → bean에 저장 -->
<jsp:useBean id="dto" class="mybean.board.BoardDto" />

<!-- 입력한 파라미터 dto에 저장
아래와 같이 *전체선택 코드를 사용할 수 없는 이유 param과 property이 다르기 때문에 하나하나 작성해줘야 한다. 
코드를 줄이기 위해서는 Post.jsp에서 name을 Dto에서 만든 필드명과 똑같이 맞춰준다.-->
<jsp:setProperty property="*" name="dto" />

<!-- BoardDao.java - setBoard메서드를 호출하기 위한 객체 생성 -->
<jsp:useBean id="dao" class="mybean.board.BoardDao" />	
	<%
		dao.setBoard(dto); //setBoard 호출하여 id="dto"를 매개변수로 전달하여 데이터 저장
		response.sendRedirect("List.jsp"); //페이지 강제로 이동
	%>