<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam4.jsp</h1>
	<!-- Param으로 저장했기때문에 getAttribute가 아니라 getParameter로 불러온다. -->
	아이디 : <%= request.getParameter("id") %><br> 
	주소 : <%= request.getParameter("addr") %><br>
</body>
</html>