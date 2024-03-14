<%@page import="mybean.CarDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>parking.jsp</title>
</head>
<jsp:useBean id="parking" class="mybean.ParkingBean" scope="application"></jsp:useBean>

<!-- 인코딩은 데이터를 주고 받기 전에 처리 -->
<% request.setCharacterEncoding("utf-8"); %>

<!-- 입차/출차 차량 저장 -->
<jsp:setProperty property="enter" name="parking" param="enter"/>
<jsp:setProperty property="exit" name="parking" param="exit"/>
<body>
	<h1>주차 관리 프로그램</h1>
	
	<form method="post">
		주차장에 들어온 차량 번호 : <input type="text" name="enter" />
		&nbsp;&nbsp;&nbsp;<input type="submit" value="입차" />
	</form>
	
	<form method="post">
		주차장에서 나간 차량 번호 : <input type="text" name="exit" />
		&nbsp;&nbsp;&nbsp;<input type="submit" value="출차" />
	</form>

	<hr/>
	
	주차된 차량 목록<br><br>
	<table border="1">
		<tr>
			<td>차량 번호</td> <td>입차 시간</td>
		</tr>
	<%
		//차량 수 많큼 반복
		//인덱스 프로퍼티 호출. useBean 태그로 만들어 놓은 parking 사용
		ArrayList<CarDto> cars = parking.getCarInfo(); //parking.getCarInfo(); → index Property
		for(int i=0; i<cars.size(); i++) {
			CarDto car = cars.get(i);
	%>
			<tr>
				<td><%=car.getPlateNumber() %></td>
				<td><%=car.getParkingTime() %></td>				
			</tr>
	<%
		}
	%>
	
	
	</table>
	<br>
	총 주차대수 : <jsp:getProperty property="counter" name="parking"/>대
</body>
</html>