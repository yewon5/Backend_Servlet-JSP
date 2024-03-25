<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서점</title>
</head>
<body>
	<h1>도서 주문 페이지</h1>
	<form action="/MVCTest/book?command=cart" method="post">
		<select name="book">
			<option>칵테일, 러브, 좀비 / 조예은 / 15000</option>
			<option>헤일메리 프로젝트 / 앤디 위어 / 21000</option>
			<option>홍학의 자리 / 정해연 / 25000</option>
			<option>밝은 밤 / 최은영 / 15000</option>
		</select>
		<b>수량 : </b>
		<input type="text" name="quantity" size="2" value="1" /> 
		<input type="submit" value="장바구니에 담기" /> 
	</form>
	<hr/>
	<!-- 페이지이동 없이 화면에 바로 장바구니 넣기 -->
	<jsp:include page="cart.jsp"></jsp:include>
</body>
</html>