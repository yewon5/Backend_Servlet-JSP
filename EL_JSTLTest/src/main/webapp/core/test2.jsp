<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str1 = "aaaa";
		
		if(str1.equals("aaaa")){
	%>
			<b>aaaa가 맞습니다.</b>
	<%
		}
	%>
	<hr>
	<c:set var="str2" value="bbbb" />
	<c:if test="${str2 eq 'bbbb' }" >
		<b>bbbb가 맞습니다.</b>
	</c:if>
	
	<hr>
	
	<form action="test2.jsp">
		숫자1 : <input type="number" name="num1" /><br><br>
		숫자2 : <input type="number" name="num2" /><br><br>
		<input type="submit" value="최대값 구하기" />
	</form>
	<hr>
	<%
		try{
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			
			if(num1 > num2){
	%>
				<%=num1 %> 크다.<br>
	<%
			}
			else{
	%>
				<%=num2 %> 크다.<br>
	<%
			}
		}
		catch(Exception err){}
	%>
	<hr>
	<c:set var="num1" value="${param.num1}" />
	<c:set var="num2" value="${param.num2}" />
	
	<c:set var="num1Parsed" value="${num1 * 1}" />
	<c:set var="num2Parsed" value="${num2 * 1}" />
	
	<c:set var="max" value="${num1Parsed}" />
	<c:if test="${num2Parsed > max}">
		<c:set var="max" value="${num2Parsed}" />
	</c:if>
	
	최대값: ${max} (문자열을 숫자열로 변환)
	<hr>
	
	<c:choose>
		<c:when test="${param.num1 > param.num2 }">
			${param.num1 } 크다. <br>
		</c:when>
		<c:when test="${param.num1 < param.num2 }">
			${param.num2 } 크다.
		</c:when>
		<c:otherwise>
			<c:if test="${!empty param.num1 }">
				똑같다.
			</c:if>
		</c:otherwise>
	</c:choose>
</body>
</html>