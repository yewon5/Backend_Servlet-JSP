<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test4.jsp</title>
</head>
<body>
    <h1>test4.jsp</h1>
    이름 : ${param.name }<br>
    나이 : ${param.age }<br>
    <hr>
    
    <h1>내가 좋아하는 영화들</h1>
    <c:forEach var="movie" items="${movies}">
        ${movie }<br>
    </c:forEach>
    <hr>
    
    <h1>댓글 리스트</h1>
    <!-- 여기에 임의의 댓글을 출력한다. -->
    1번님 : ${comment[0] }<br>
    2번님 : ${comment[1] }<br>
    3번님 : ${comment[2] }<br>
    <br><br><br>
    
    <!-- 회원일 경우에만 아래의 댓글 작성 폼이 보여지게 한다. -->
	<c:choose>
		<c:when test="${empty param.id and empty param.pw }">
		<!-- 아이디와 비밀번호가 비어있으면(true) 로그인창 표시-->
			<form method="post" >
				ID : <input type="text" name="id" /><br><br>
				PW : <input type="text" name="pw" />  <input type="submit" value="로그인" /><br><br>
			</form>
		</c:when>
		<c:when test="${!empty param.id and !empty param.pw }">
		<!-- 아이디 비번을 입력했을때(true) 텍스트창이 보여짐 -->
			 <form>
		        댓글 작성<br>
		        <textarea row="3" cols="60"></textarea>
		        <input type="submit" value="댓글 달기" />
    		</form>
		</c:when>
		<c:otherwise>
		<!-- 아이디 비번 둘 중 하나 미입력시(false) 텍스트가 보여짐 -->
			로그인하세요		
		</c:otherwise>
	</c:choose>
</body>
</html>