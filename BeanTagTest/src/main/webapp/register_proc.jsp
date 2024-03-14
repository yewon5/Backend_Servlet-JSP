<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 객체 생성 -->
	<jsp:useBean id="mem" class="mybean.MemberDto" ></jsp:useBean>
	<jsp:setProperty property="*" name="mem"/>
	<!-- property="*" 사용으로 나머지는 생략 가능
	<jsp:setProperty property="mem_pw" name="mem" param="mem_pw"/>
	<jsp:setProperty property="mem_name" name="mem"/>
	<jsp:setProperty property="mem_email" name="mem"/>
	<jsp:setProperty property="mem_tel" name="mem"/>
	<jsp:setProperty property="mem_addr" name="mem"/>
	-->
	
	<h2>입력 내용 확인</h2>
	아이디 : <jsp:getProperty property="mem_id" name="mem"/> <br>
	패스워드 : <jsp:getProperty property="mem_pw" name="mem"/> <br>
	이름 : <jsp:getProperty property="mem_name" name="mem"/> <br>
	이메일 : <jsp:getProperty property="mem_email" name="mem"/> <br>
	전화번호 : <jsp:getProperty property="mem_tel" name="mem"/> <br>
	주소 : <jsp:getProperty property="mem_addr" name="mem"/> <br>
</body>
</html>