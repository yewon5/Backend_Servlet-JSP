
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<!-- 숫자 포맷 -->
	<fmt:formatNumber value="100000000"/><br>
	<fmt:formatNumber value="100000000" groupingUsed="false"/><br>
	<fmt:formatNumber value="3.141598" pattern="#.##"/><br>
	<fmt:formatNumber value="0.7" type="percent"/><br>
	<fmt:formatNumber value="250000000" type="currency"/><br>
	<fmt:formatNumber value="250000000" type="currency" currencySymbol="$"/><br>
	<hr>
	
 	<!-- 날짜 포맷 -->
 	<c:set var="today" value="<%= new Date() %>" />
 	
 	
 	<fmt:formatDate value="${today }" type="date" /><br>
 	<fmt:formatDate value="${today }" type="time" /><br>
 	<fmt:formatDate value="${today }" type="both" /><br>
 	<br>
 	
 	<fmt:formatDate value="${today }" dateStyle="short" /><br>
 	<fmt:formatDate value="${today }" dateStyle="medium" /><br>
 	<fmt:formatDate value="${today }" dateStyle="long" /><br>
 	<fmt:formatDate value="${today }" dateStyle="full" /><br>
 	<br>
 	
 	<fmt:formatDate value="${today }" timeStyle="short" type="time" /><br>
 	<fmt:formatDate value="${today }" timeStyle="medium" type="time" /><br>
 	<fmt:formatDate value="${today }" timeStyle="long" type="time" /><br>
 	<fmt:formatDate value="${today }" timeStyle="full" type="time" /><br>
 	<br>
 	
 	<fmt:formatDate value="${today }" pattern="yyyy/mm/dd(E)"/>
	<hr>
	
	<!-- 원하는 국가 형태 -->
	<fmt:setLocale value="en_us"/>
	<fmt:formatNumber value="250000000" type="currency" /><br>
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full" />
	<hr>
	
	<!-- 해당 국가 표준시간 -->
	<fmt:setLocale value="ko_kr" />
	서울 : <fmt:formatDate value="${today }" type="both" />
 	<br>
 	<fmt:timeZone value="Asia/Hong_kong">
 	홍콩 : <fmt:formatDate value="${today }" type="both"/>
 	</fmt:timeZone>
 	 	<br>
 	<fmt:timeZone value="Europe/London">
 	런던 : <fmt:formatDate value="${today }" type="both"/>
 	</fmt:timeZone>
 	 	<br>
 	<fmt:timeZone value="America/New_York">
 	뉴욕 : <fmt:formatDate value="${today }" type="both"/>
 	</fmt:timeZone>
 	
 	<!-- 문자 인코딩 -->
 	<fmt:requestEncoding value="utf-8"/>
</body>
</html>