<%@page import="mybean.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=utf-8" %>

<!-- 페이징을 위한 인스턴스 변수 선언 -->
<%
	int totalRecord = 0; //총 글의 개수
	int numPerPage = 5; //한 페이지당 보여지는 글의 개수
	int tatalPage = 0; //총 페이지 수 
	int nowPage = 0; //현재 페이지 번호
	
%>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check(){
		if(document.search.searchText.value == ""){
			alert("검색어를 입력하세요.");
			document.search.searchText.focus();
			return;
		}
		document.search.submit();
	}
</script>
<BODY>
<jsp:useBean id="dao" class="mybean.board.BoardDao" />

<%
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("keyword");	
	String searchText = request.getParameter("searchText");
	
	ArrayList list = (ArrayList)dao.getBoardList(keyword, searchText);
%>

<center><br>
<h2>JSP Board</h2>

<table align=center border=0 width=80%>
<tr>
	<td align=left>Total :  <%=list.size()%> Articles(
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
	if(list != null){
		for(int i=0; i<list.size(); i++){
			BoardDto dto = (BoardDto)list.get(i);
%>
			<tr align=center bgcolor="white" height=120%>
				<td><%=dto.getB_num()%></td>
				<td><a href="Read.jsp?b_num=<%=dto.getB_num()%>"><%=dto.getB_subject()%></td>
				<td><%=dto.getB_name()%></td>
				<td><%=dto.getB_regdate()%></td>
				<td><%=dto.getB_count()%></td>
			</tr>
<% 
		}
	}
	else{
%>
			<tr><td>데이터가 없습니다.</td></tr>
<%
	}
%>
		</table>
	</td>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>
	<td align="left">Go to Page </td>
	<td align=right>
		<a href="Post.jsp">[글쓰기]</a>
		<a href="javascript:list()">[처음으로]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyword" size="1">
				<option value="b_name"> 이름
				<option value="b_subject"> 제목
				<option value="b_content"> 내용
			</select>

			<input type="text" size="16" name="searchText" >
			<input type="button" value="찾기" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
</center>	
</BODY>
</HTML>