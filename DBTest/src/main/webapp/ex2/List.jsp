<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mybean.board.BoardDao"%>
<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
<BODY>
<center><br>
<h2>JSP Board</h2>
<jsp:useBean id ="dao" class="mybean.board.BoardDao" />

<table align=center border=0 width=80%>
	<tr>
		<td align=left>Total :  Articles(
			<font color=red>  1 / 10 Pages </font>)
		</td>
	</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
	<tr>
		<td align=center colspan=2>
			<table border=0 width=100% cellpadding=2 cellspacing=0>
				<tr align=center bgcolor=#D0D0D0 height=120%>
					<td> 번호 </td>
					<td> 제목 </td>
					<td> 이름 </td>
					<td> 날짜 </td>
					<td> 조회수 </td>
				</tr>
			<%
			 	request.setCharacterEncoding("utf-8");
				String keyword = request.getParameter("keyword");
				String searchText = request.getParameter("searchText");
				
				try{
					List<BoardDto> list = dao.getBoardList(keyword, searchText);
					
					for(BoardDto Board : list) {
			%>
				<tr align=center bgcolor="white" height=120%>
					<td><%=Board.getB_num() %></td>
					<td><%=Board.getB_subject() %></td>
					<td><%=Board.getB_name() %></td>
					<td><%=Board.getB_regdate() %></td>
					<td><%=Board.getB_count() %></td>
				</tr>
			<%	
					}
				}
				catch(Exception err){
					err.printStackTrace();
				}
			%>
			</table>
		</td>
	</tr>
	<tr>
		<td><BR></td>
	</tr>
	<tr>
		<td align="left">Go to Page </td>
		<td align=right>
			<a href="Post.jsp">[글쓰기]</a>
			<a href="javascript:list()">[처음으로]</a>
		</td>
	</tr>
</table><BR>

<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
		<tr>
			<td align=center valign=bottom>
				<select name="keyField" size="1">
					<option value="name"> 이름
					<option value="subject"> 제목
					<option value="content"> 내용
				</select>
	
				<input type="text" size="16" name="keyWord" >
				<input type="button" value="찾기" onClick="check()">
				<input type="hidden" name="page" value= "0">
			</td>
		</tr>
	</table>
</form>
</center>	
</BODY>
</HTML>