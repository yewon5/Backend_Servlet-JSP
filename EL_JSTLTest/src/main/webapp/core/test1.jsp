<%@ page contentType="text/html; charset=UTF-8" %>
<!-- 미리 만들어 놓은 액션태그를 가져다 쓰기.  prefix는 core를 따와서 c로 사용-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int var1 = 10;
	%>
	<%=var1 %>
	<br>
	
	<c:set var="var2" value="20" />
	${var2 }
	
	<br>
	
	<c:set var="var3" value="30" />
	<c:set var="result" value="${var2 + var3 }" />
	두 수의 합은 ${result }입니다.
</body> 
</html>