<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.b_pass.value == "") {
			alert("패스워드를 입력하세요.");
			form.b_pass.focus();
			return false;
		}
		document.form.submit();
	}
</script>
</head>

<jsp:useBean id="dao" class="mybean.board.BoardDao" />
<%
    String b_num = request.getParameter("b_num");
    
    if (b_num != null) {
        int num = Integer.parseInt(b_num);
        dao.deleteBoard(num); // 비밀번호를 확인하지 않고 바로 글을 삭제합니다.
        response.sendRedirect("List.jsp");
    }
%>

<body>
<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="Delete.jsp" >
<input type="hidden" name="b_num" value="<%=b_num%>"/>
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="b_pass" size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>
