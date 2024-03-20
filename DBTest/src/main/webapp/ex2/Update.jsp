<%@page import="mybean.board.BoardDto"%>
<%@page import="mybean.board.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head> <title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
	   if (document.form.b_pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
	     form.b_pass.focus();
		 return false;
		}
	   document.form.submit();
	}
</script>
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
<center>
<br><br>
<table width=460 cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=#FF9018  height=21 align=center class=m>수정하기</td>
  </tr>
</table>

<form name=form method=post action="UpdateProc.jsp" >
<input type="hidden" name="b_num" value="<%=b_num %>" />
<table width=70% cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
    <tr>
     <td width=20%>성 명</td>
     <td width=80%>
	  <input type=text name="b_name" size=30 maxlength=20 value="<%=dto.getB_name() %>">
	 </td>
	</tr>
    <tr>
     <td width=20%>E-Mail</td>
     <td width=80%>
	  <input type=text name="b_email" size=30 maxlength=30 value="<%=dto.getB_email() %>">
	 </td>
    </tr>
	<tr>
     <td width=20%>제 목</td>
     <td width=80%>
	  <input type=text name="b_subject" size=50 maxlength=50 value="<%=dto.getB_subject() %>">
	 </td>
    <tr>
     <td width=20%>내 용</td>
     <td width=80%>
	  <textarea name="b_content" rows=10 cols=50><%=dto.getB_content() %></textarea>
	 </td>
    </tr>
	<tr>
     <td width=20%>비밀 번호</td> 
     <td width=80%><input type=password name="b_pass" size=15 maxlength=15>
      수정시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr>
     <td colspan=2>
	  <input type=Button value="수정완료" onClick="check()">
      <input type=reset value="다시수정"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
</form> 
</center>
</body>
</html>