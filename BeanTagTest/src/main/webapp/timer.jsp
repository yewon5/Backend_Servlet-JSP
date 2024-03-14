<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>timer.jsp 현재 접속자만 각각 시간 측정</title>
</head>
<body>
	<h1>세션을 이용한 타이머 예제</h1>
	<!-- 현재 접속한 사용자의 경과시간을 체크하는 것이기 때문에 session을 사용한다.  다른 브라우저를 사용할 경우 세션값은 초기화된다.-->
	<!-- session이라서 페이지를 새로고침해도 객체가 다시 만들어지지 않기 때문에 태그사이에 메세지를 넣으면 처음에만 보여지고, 새로고침하면 메세지가 사라진다. -->
	<jsp:useBean id="timer" class="scope.TimerBean" scope="session">세션 시작합니다. 타이머 작동을 시작합니다.<br><br></jsp:useBean> 
	
	bean의 프로퍼티를 마지막으로 접근한 뒤에 경과한 시간은
	<jsp:getProperty property="elapsedTimeAfterLastAccess" name="timer"/>초 입니다.<br><br>
	
	<!-- 세터메서드는 반드시 파라미터를 넘겨줘야한다. param 속성을 따로 지정하지 않으면 property 값이 기본값. -->
	<jsp:setProperty property="restart" name="timer" param="restart"/> 
	

	타이머를 리셋한 뒤에 경과된 시간은 <jsp:getProperty property="elapsedTime" name="timer"/>초 입니다.<br><br>
	
	<!-- 처음 접속부터 지금까지 전체적인 경과 시간. 사용자가 현재페이지에서 얼마나 머무르고 있는지를 확인. -->
	타이머가 시작된 뒤에 경과된 시간은 <jsp:getProperty property="elapsedTimeAfterInst" name="timer"/>초 입니다.<br><br>
	
	<!-- 액션 생략시 디폴트 값은 자기자신의 페이지에 전송 -->
	<form method="post">
		<input type="submit" value="경과시간 확인" name="check" /> &nbsp;&nbsp;&nbsp;
		<input type="submit" value="타이머 리셋" name="restart" />
	</form>
</body>
</html>

<!-- 
name						r/w		data type
----------------------------------------------
elapsedTime					r		long
restart						w		boolean
elapsedTimeAfterInst		r		long
elapsedTimeAfterLastAccess	r		long
 -->