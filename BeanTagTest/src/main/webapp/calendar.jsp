<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date, java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date today = new Date();
		Calendar cal = Calendar.getInstance(); //단 하나의 객체만 생성
	%>
	오늘은 <%=today.toString() %> 입니다.<br>
	<%=cal.get(Calendar.YEAR) %>년 &nbsp;
	<%=cal.get(Calendar.MONTH) + 1 %>월 &nbsp;
	<%=cal.get(Calendar.DATE) %>일 입니다.
	
	<hr/>
	<!-- 객체 생성 scope 미기재시 "page" 디폴트 값-->
	<jsp:useBean id="curDate" class="simple.CalendarBean" scope="page"></jsp:useBean>
	오늘은 <jsp:getProperty property="today" name="curDate"/> 입니다. <br>
	<jsp:getProperty property="year" name="curDate"/>년&nbsp;
	<jsp:getProperty property="month" name="curDate"/>월&nbsp;
	<jsp:getProperty property="date" name="curDate"/>일 입니다.
	<br><br>
	<jsp:setProperty property="greeting" name="curDate" value="좋은 아침입니다."/>
	인사말 : <jsp:getProperty property="greeting" name="curDate"/>
</body>
</html>

<!-- 
	class name : simple.CalendarBean
	constructor(생성자) : yes
	property :
		name		r/w			data type
		---------------------------------
		today		r			Date
		year		r			int
		month		r			int	
		date		r			int
 -->