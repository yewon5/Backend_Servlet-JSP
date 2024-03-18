<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>counter.jsp</title>
</head>
<body>
	<!-- 세션은 해당사용자가 몇 번 방문했는지 카운트. 어플리케이션은 모든 사용자의 방문자수를 카운트 
	개선점 1. 접속 해제해도 방문자 숫자를 지속적으로 유지하기위해 파일로 처리해야한다. 10명에 1번 or 20번에 1번 등
		 2. 같은 사용자가 새로고침했을때 카운트가 되는 것을 방지해야한다. session
	-->
	<h1>전체 방문자 수 확인</h1>
	<jsp:useBean id="counter" class="scope.CounterBean" scope="application">
		<jsp:setProperty property="newVisit" name="counter" value="1" />
	</jsp:useBean>

	<jsp:setProperty property="restart" name="counter" />
	
	<h2>전체 방문자 수 : <jsp:getProperty property="visitCount" name="counter" /> </h2>
	
	<form>
		<input type="submit" name="refresh" value="새로 고침" /> &nbsp;&nbsp;&nbsp;
		<input type="submit" name="restart" value="카운터를 0으로 리셋" />
		 
	</form>
</body>
</html>