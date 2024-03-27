<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test6.jsp</title>
</head>
<body>
	<jsp:useBean id="dto" class="mybean.BeanTest" />
	<jsp:setProperty property="name" value="홍길동" name="dto" />
	<jsp:setProperty property="price" value="10000" name="dto" />
	
	이름 : <jsp:getProperty property="name" name="dto"/><br>
	가격 : <jsp:getProperty property="price" name="dto"/><br>
	<hr>
	
	<!-- EL 방식 -->
	이름 : ${dto.name }<br>
	가격 : ${dto["price"] }<br>
	<hr>
	<a href="/EL_JSTLTest/eltest.do?name=Won">서블릿에게 요청</a>
</body>
</html>