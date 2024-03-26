<%@page import="mybean.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<%
	ArrayList<Book> bookList = (ArrayList<Book>)session.getAttribute("bookList");
%>

<body>
	<b>현재 주문한 도서</b>
	<table border="1">
		<tr>
			<th>도서 제목</th><th>작가</th><th>가격</th><th>수량</th>
		</tr>
	<%
		if(bookList != null) {
			for(int cnt=0; cnt<bookList.size(); cnt++) { //for(Book b : bookList) 간단하게 받아 올 수 있지만 이렇게하면 몇번째인지 순서를 알 수 없기 때문에 조건문을 바꿔준다.
				Book b = bookList.get(cnt); //받아오기
	%>
			<tr>
				<td><%=b.getTitle() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getQuantity() %></td>
				<td>
					<form action="/MVCTest/book" method="post">
						<input type="hidden" name="command" value="del"> <!-- command 히든태그 추가 -->
						<input type="hidden" name="cnt" value="<%=cnt %>"> <!-- 삭제기능 히든태그 추가 -->
						<input type="submit" value="삭제">
					</form>
				</td>
			</tr>
	<%
			}
		}
	%>
	</table>
	<br>
	<form action="/MVCTest/book?command=checkout" method="post">
		<input type="submit" value="체크아웃">
	</form>
</body>
</html>