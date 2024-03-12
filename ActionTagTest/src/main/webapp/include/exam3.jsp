<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>exam3.jsp</h1>
	exam4에게 데이터를 전달<br>
	1. url을 이용 : http://localhost:8080/ActionTagTest/include/exam4.jsp?id=hong&addr=seoul<br>
	2. 하이퍼링크 이용<br>
	3. 폼태그 이용<br>
	4. ActionTag 이용(include)
	<jsp:include page="exam4.jsp">
		<jsp:param name="id" value="hong" />
		<jsp:param name="addr" value="seoul" />
	</jsp:include> <!-- 함수호출하듯이 페이지 이동 후 되돌아옴 -->
</body>
</html>