<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message.jsp</title>
</head>
<body>
	<!-- 1.직접 자바코드를 끼워넣는 방법 -->
	<%
		String msg = "JSP를 배웁시다.";
	%>
	Message : <%=msg%>
	
	<hr/>
	
	<!-- 클래스를 만들고 쓰려면 객체생성을 해야함. 이걸 태그를 통해서 할 수 있음. -->
	<%-- simple.MessageBean msg1 = new simple.MessageBean(); --%> 
	
	
	<!-- 2. 클래스를 따로 만들어서 불러다 쓰는 방법 : 액션 태그 -->
	<!-- 아이디 자율, class="객체생성하고싶은 패키지명.클래스명" -->
	<jsp:useBean id="msg1" class="simple.MessageBean"></jsp:useBean>
	
	<!-- 원래는 msg1.setMsg("JSP를 배웁시다"); -->
	<jsp:setProperty property="msg" name="msg1" value="Jsp를 배웁시다."/>
	
	Message : <jsp:getProperty property="msg" name="msg1"/>
	
	<hr/>
	
	<!-- 3. 클래스를 따로 만들어서 불러다 쓰는 방법 : 바로 불러서 사용 -->
	<%
		simple.MessageBean msg2 = new simple.MessageBean();
		msg2.setMsg("JSP를 배웁시다");
	%>
	Message : <%=msg2.getMsg()%>
</body>
</html>

<!-- 
	class name : simple.MessageBean
	property : 
		name	r(get)/w(set)	data type	dese
		----------------------------------------------
		msg		r/w				String		메세지 입출력
 -->