<%@page import="mybean.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매페이지</title>
</head>
<%
	request.setCharacterEncoding("utf-8");

	ArrayList<Book> bookList = (ArrayList<Book>)session.getAttribute("bookList"); //장바구니 꺼내오기
	
	int amount = 0;
	for(Book b : bookList){
		amount += b.getPrice() * b.getQuantity();
	}
%>
<body>
	<h1>도서 구매 주문 페이지</h1>
	<b>주문한 도서</b>
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
			</tr>
	<%
			}
		}
	%>
	</table>
	<br>
	<b>전체 구입액수 : <%=amount%> </b>
	<br>
	<form method="post">
		<input type="submit" value="결제">
	</form>
</body>
</html>