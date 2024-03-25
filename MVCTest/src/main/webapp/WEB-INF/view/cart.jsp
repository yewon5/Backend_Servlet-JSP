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
			for(Book b : bookList) {
	%>
			<tr>
				<td><%=b.getTitle() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getQuantity() %></td>
				<td>
					<form action="/MVCTest/book?command=del">
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