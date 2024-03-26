<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setAttribute("cnt1", 100); //cnt1속성에 100저장 %>

	<!-- 출력 방법1  -->
	<% out.println(request.getAttribute("cnt1") + "<br>"); %>
	
	<!-- 출력 방법2 -->
	<%= request.getAttribute("cnt1") %><br> 
	
	<!-- 출력 방법3 여러번 사용할 경우 변수에 받아서 사용 -->
	<% int cnt2 = (Integer)request.getAttribute("cnt1"); %>
	<%= cnt2 %><br> 
	<hr>
	<hr>
	
	<!-- EL 방법1  attribute명 (속성이름), ${cnt2} 지역 변수라서 출력 안됨
	영역을 적어주지 않았는데 리퀘스트인지 어떻게 알고 꺼내오는 걸까? 페이지, 리퀘스트, 세션, 어플리케이션 순으로 찾아낸다.  -->
	${cnt1}<br>
	
	<!-- EL 방법2 EL 내장 객체. request에 저장했기때문에 page에서는 꺼내올 수 없다. -->
	${requestScope.cnt1}<br>
	${pageScope.cnt1}<br>
	<!-- pageScope를 자바코드로 작성시 null 오류가 뜨지만, EL은 자체적으로 예외처리를 해주기때문에 null 오류가 뜨지 않는다. -->
	
	<% session.setAttribute("cnt3", 300); %>
	${cnt3}<br>
	${sessionScope.cnt3}<br>
	${sessionScope["cnt3"]}<br>
	<!-- 숫자가 아니라 문자열이기때문에 대괄호안에 큰따옴표로 묶어준다. -->
</body>
</html>