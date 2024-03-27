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
    <br><br><br>
    <!-- 회원일 경우에만 아래의 댓글 작성 폼이 보여지게 한다. -->
    <form>
        댓글 작성<br>
        <textarea row="3" cols="60"></textarea>
        <input type="submit" value="댓글 달기" />
    </form>
</body>
</html>