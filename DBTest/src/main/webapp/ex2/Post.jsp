<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<br><br>
<table width=80% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=84F399 height=25 align=center>글쓰기</td>
 </tr>
</table>
<br>
<table width=80% cellspacing=0 cellpadding=3 align=center>
<form name=post method=post action="PostProc.jsp" >
	<input type="hidden" name="b_ip" value="<%=request.getRemoteAddr() %>" />
 <tr>
  <td align=center>
   <table border=0 width=100% align=center>
    <tr>
     <td width=10%>성 명</td>
     <td width=90%><input type=text name="b_name" size=10 maxlength=8 required="required"></td>
    </tr>
    <tr>
	 <td width=10%>E-Mail</td>
	 <td width=90%><input type=text name="b_email" size=30 maxlength=30 required="required"></td>
    </tr>
    <tr>
     <td width=10%>홈페이지</td>
     <td width=90%><input type=text name="b_homepage" size=40 maxlength=30 required="required"></td>
    </tr>
    <tr>
     <td width=10%>제 목</td>
     <td width=90%><input type=text name="b_subject" size=50 maxlength=30 required="required"></td>
    </tr>
    <tr>
     <td width=10%>내 용</td>
     <td width=90%><textarea name="b_content" rows=10 cols=50 required="required"></textarea></td>
    </tr>
    <tr>
     <td width=10%>비밀 번호</td> 
     <td width=90% ><input type=password name="b_pass" size=15 maxlength=15 required="required"></td>
    </tr>
    <tr>
     <td colspan=2><hr size=1></td>
    </tr>
   </table>
   <form>
	<table align="left">
    <tr>
     <td><input type=submit value="등록" >&nbsp;&nbsp;
         <input type=reset value="다시쓰기">&nbsp;&nbsp;
	 </td>
	</tr>
   </table>
   </form>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>