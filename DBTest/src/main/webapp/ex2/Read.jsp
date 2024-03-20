<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	int b_num = Integer.parseInt(request.getParameter("b_num")); //글 번호 받아오기
%>
<!-- BoardDao.java - getBoard메서드를 호출하기 위한 객체 생성 -->
<jsp:useBean id="dao" class="mybean.board.BoardDao" />
<%
	BoardDto dto = dao.getBoard(b_num); //getBoard(b_num)메서드를 호출하여 dto객체에 저장
%>
<body>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> 이 름 </td>
	 <td bgcolor=#ffffe8><%=dto.getB_name() %></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=dto.getB_regdate() %></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><%=dto.getB_email() %></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="http://" target="_new">http://</a><%=dto.getB_homepage() %></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=dto.getB_subject() %></td>
   </tr>
   <tr> 
    <td colspan=4>
	<%            
    	String content = dto.getB_content();
            if(content != null) {
                out.println(content.replace("\n", "<br>"));
            } else {
                out.println(""); // 빈 문자열 출력
            }
 	%> <!-- (엔터키를 찾고, 줄바꿈을 실행한다) -->
 	</td> 
   </tr>
   <tr>
    <td colspan=4 align=right>
     로 부터 글을 남기셨습니다./  조회수 : <%=dto.getB_count() %>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:list()">목 록</a> | 
	<a href="Update.jsp?b_num=<%=b_num%>">수 정</a> |
	<a href="Delete.jsp?b_num=<%=b_num%>">삭 제</a> ]<br>
  </td>
 </tr>
</table>
</body>
</html>
