<%@page import="mybean.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=utf-8" %>

<!-- 페이징을 위한 인스턴스 변수 선언 -->
<%
	int totalRecord = 0; //총 글의 개수
	int numPerPage = 8; //한 페이지당 보여지는 글의 개수
	int totalPage = 0; //총 페이지 수 
	int nowPage = 0; //현재 페이지 번호
	int beginPerPage = 0; //페이지별 시작 번호. 1페이지당 5개씩 등록할때, 2페이지는 6번부터 시작할 수 있도록
	int pagePerBlock = 3; //한 블럭에 페이지수를 몇개까지 보여지게 할 것인지 1 2 3..▷ ◁..4 5 6..▷
	int totalBlock = 0; //총 블럭 수
	int nowBlock = 0; //현재 블럭
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
	
	totalRecord = list.size(); //이걸 알아야 몇페이지로 나눌지 알 수 있다.
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage); 
	//Ceil는 더블형인데, totalRecord / numPerPage;는 정수형이라서 캐스팅해주고, tatalPage가 정수형이니까 int로 한번 더 캐스팅해준다.
	//나머지가 있으면 몫을 올림으로 해줘야 1개 게시글의 짜투리가 나왔을때 다음페이지로 넘어간다.
	//Round 반올림, Ceil 무조건올림, Floor 무조건내림
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	//"1"문자는 숫자로 바꿀 수 있는데, null은 숫자로 바꿀 수 없다.
	//해당 코드는 페이지번호를 클릭했을때 실행하도록 해야 한다.
	
	
	beginPerPage = nowPage * numPerPage;
	//0,1,2,3,4 0페이지. 5,6,7,8,9 1페이지. 10,11,12,13,14 2페이지 = 0,1,2,3,4 numPerPage
			
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
%>

<center><br>
<h2>JSP Board📄</h2>

<table align=center border=0 width=80%>
<tr>
	<td align=left>Total :  <%=totalRecord%> Articles(
		<font color=red>  <%=nowPage+1 %> / <%=totalPage %> Pages </font>)
	</td>
	<td align=right>
		<a href="Post.jsp">[글쓰기✏️]</a>
		<a href="javascript:list()">[처음으로]</a>
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td> 번호 </td>
				<td align=left> 제목 </td>
				<td> 이름 </td>
				<td> 날짜 </td>
				<td> 조회수👀 </td>
			</tr>
<%
	if(list != null){
		for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
			if( i == totalRecord) { // 무조건 5개씩 출력하려고하니까 오류가 남. break 걸어준다.
				break;
			}
			
			BoardDto dto = (BoardDto)list.get(i);
%>
			<tr align=center bgcolor="white" height=120%>
				
				<td ><%=dto.getB_num()%></td>
				<td align=left><%=dao.useDepth(dto.getDepth()) %><a href="Read.jsp?b_num=<%=dto.getB_num()%>"><%=dto.getB_subject()%></td>
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
	<td><BR></td>
</tr>
<tr>
	<td align="center">Go to Page &nbsp;&nbsp;&nbsp;
	<%if(nowBlock > 0) { %>
	<a href="List.jsp?nowPage=<%=((nowBlock-1) * pagePerBlock)%>&nowBlock=<%=nowBlock-1 %>">👈이전 <%=pagePerBlock %>개</a>&nbsp;&nbsp;
	<% } %>
	<% 
		for(int i=0; i<pagePerBlock; i++) { //총 페이지는 7페이지인데 한 블럭당 무조건 3페이지가 보여지게 해서 8,9페이지가 보여지고 오류남. 
			if((nowBlock * pagePerBlock) + i == totalPage) { // 무조건 5개씩 출력하려고하니까 오류가 남. break 걸어준다.
				break;
			}
	%>
	&nbsp;&nbsp;&nbsp; <a href="List.jsp?nowPage=<%=(nowBlock * pagePerBlock) + i%>&nowBlock=<%=nowBlock %>"><%=(nowBlock * pagePerBlock) + i+1 %></a> &nbsp;&nbsp;&nbsp;
	<% 
		}
	%>
	&nbsp;&nbsp;
	<%if(totalBlock > nowBlock+1) { %>
	<a href="List.jsp?nowPage=<%=((nowBlock+1) * pagePerBlock)%>&nowBlock=<%=nowBlock+1 %>">다음 <%=pagePerBlock %>개👉</a>
	<!-- 블럭단위 이동. 다음블럭이라+1 무조건 시작페이지라서 +i는 필요 없음 -->
	<% } %>
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