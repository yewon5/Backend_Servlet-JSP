<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test7.jsp</title>
</head>
<body>
	<h2> ${param.name }님 환영합니다.</h2>
	총 방문자 수 : ${requestScope.visitCount }<br>
	<hr>
	${param.name }님이 좋아하는 음식은? <br>
	${foods[0] }<br>
	${requestScope.foods[1] }<br>
	${foods["2"] }<br>
	${foods[3] }<br>
	${foods[4] }<br>
	<hr>
	
	연두부의 주인 이름 : ${won.name }<br> <!-- won의 getName() 메소드를 호출하여 이름을 가져옴 -->
	원님의 강아지 이름 : ${won.dog.name }<br> <!-- won 객체의 getDog() 메소드를 호출하여 해당 객체의 Dog 속성에 접근한 후, 그 Dog 객체의 getName() 메소드를 호출하여 강아지의 이름을 가져옴 -->
</body>
</html>