<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="test2_proc.jsp" method="post">
		이름 : <input type="text" name="name" /><br><br>
		ID : <input type="text" name="id" /><br><br>
		
		
		첫번째 좋아하는 음식 : <input type="text" name="food" /><br><br>
		두번째 좋아하는 음식 : <input type="text" name="food" /><br><br>
		
		<input type="checkbox" name="hobby" value="클라이밍" />클라이밍<br>
		<input type="checkbox" name="hobby" value="등산" />등산<br>
		<input type="checkbox" name="hobby" value="독서" />독서<br>
		
		<input type="submit" vlaue="전송" />
	</form>
</body>
</html>